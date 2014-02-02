class YandexMoneysController < ApplicationController
  YANDEX_CERTIFICATE = 'cert/Yandex.Money.crt'
  
  skip_before_action :authorize
  before_action :verification_of_PKCS7 if (Rails.env.production? or Rails.env.staging?)
  before_action :decrypt_yandex_enterence_body
  before_action :get_yandex_params_from_enterence_body
  after_action :logging
  
  # Check user order from Yandex.Money
  # POST /yandex_money/check_order
  def check_order
    @yandex_payment = YandexMoney.new(yandex_params)
    @error_code = 100 unless @yandex_payment.save
  end
  
  # Yandex.Money send payment done
  # POST /yandex_money/payment_done
  def payment_done
    @yandex_payment = YandexMoney.find_by(invoiceId: yandex_params[:invoiceId])
    if @yandex_payment.update yandex_params
      add_gems_to_user
    else
      @error_code = 100
    end
  end
  
  private
    
    def yandex_params
      params.require(:yandex).permit(
        :requestDatetime,
        :action,
        :shopId,
        :shopArticleId,
        :invoiceId,
        :customerNumber,
        :orderCreatedDatetime,
        :orderSumAmount,
        :orderSumCurrencyPaycash,
        :orderSumBankPaycash,
        :shopSumAmount,
        :shopSumCurrencyPaycash,
        :shopSumBankPaycash,
        :paymentDatetime,
        :paymentPayerCode,
        :user_id,
        :gemSum)
    end
    
  protected
  
    def add_gems_to_user
      unless @error_code or @yandex_payment.valid?
        begin
          result = api_call("/api/user.gems.add?user_id=" + URI::encode(yandex_params[:user_id]) + "&count=" + URI::encode(yandex_params[:gemSum]))
          if result["error"]
            YandexMoney.log.error "Game server error: #{@error_code}. Invoice id: #{@yandex_payment.invoiceId}"
          end
        rescue
          YandexMoney.log.error "Game server error: API not work. Invoice id: #{@yandex_payment.invoiceId}"
        end
      end
    end

    def decrypt_yandex_enterence_body
      if request.raw_post
        data = request.raw_post

        data = data.sub! '-----BEGIN PKCS7-----', ''
        data = data.sub! '-----END PKCS7-----', ''
        data += "=="

        data = Base64.decode64(data)
        data = get_xml_from_data(data)
        @enterence_xml = data.encode('UTF-8', invalid: :replace, undef: :replace, replace: '').delete("\u0004")
      end
    end

    def get_xml_from_data(data)
      # find index of <?xml (=> startIndex)
      startIndex = data.index("<?xml")
      # read <\?xml version="1\.0" encoding="UTF\-8" \?><(\w+)\s ((\w+) => rootTag)
      rootTag, temp = data.match(/<\?xml version="1\.0" encoding="UTF\-8" \?><(\w+)\s/i).captures
      # find index of </{rootTag}> (=> endIndex)
      endTag = "</#{rootTag}>"
      endIndex = data.index(endTag) + endTag.length

      data[startIndex, endIndex - startIndex]
    end

    def get_yandex_params_from_enterence_body
      hash = Hash.from_xml(@enterence_xml)
      action_name = hash.keys.first
      begin
        params[:yandex] = {
              requestDatetime:         hash[action_name]['requestDatetime'],
              action:                  action_name,
              shopId:                  hash[action_name]['shopId'],
              invoiceId:               hash[action_name]['invoiceId'],
              customerNumber:          hash[action_name]['customerNumber'],
              orderCreatedDatetime:    hash[action_name]['orderCreatedDatetime'],
              orderSumAmount:          hash[action_name]['orderSumAmount'],
              orderSumCurrencyPaycash: hash[action_name]['orderSumCurrencyPaycash'],
              orderSumBankPaycash:     hash[action_name]['orderSumBankPaycash'],
              shopSumAmount:           hash[action_name]['shopSumAmount'],
              shopSumCurrencyPaycash:  hash[action_name]['shopSumCurrencyPaycash'],
              shopSumBankPaycash:      hash[action_name]['shopSumBankPaycash'],
              paymentDatetime:        (hash[action_name]['paymentDatetime'] rescue nil),
              paymentPayerCode:        hash[action_name]['paymentPayerCode'],
              user_id:                (hash[action_name]['user_id'] rescue nil),
              gemSum:                 (hash[action_name]['gemSum'] rescue nil)
        }
      rescue
        @error_code = 200
      end
    end
    
    def verification_of_PKCS7
      enterence_body = request.raw_post
      
      store = OpenSSL::X509::Store.new
      cert  = OpenSSL::X509::Certificate.new(File.read(YANDEX_CERTIFICATE))
      store.add_cert(cert)

      p7sign = OpenSSL::PKCS7.new(enterence_body)
      unless p7sign.verify(nil, store, nil, OpenSSL::PKCS7::NOVERIFY)
        @error_code = 1
        YandexMoney.log.error "Verification error. Error: #{@error_code}. Action: #{@yandex_params.action}. Model error: #{@yandex_payment.errors.full_messages.join(', ')}. Invoice id: #{@yandex_payment.invoiceId}"
      end
    end

    def logging
      if @error_code or @yandex_payment.invalid?
        YandexMoney.log.error "Error: #{@error_code}. Action: #{@yandex_params.action}. Model error: #{@yandex_payment.errors.full_messages.join(', ')}. Invoice id: #{@yandex_payment.invoiceId}"
      else
        YandexMoney.log.info "Invoice id: #{@yandex_payment.invoiceId} - success"
      end
    end
end
