class YandexMoney < ActiveRecord::Base
  YANDEX_MONEY_API_HOST = Rails.env.production? ? 'https://money.yandex.ru/api/%s' : 'http://localhost:4567/yandex_money/%s'
  
  belongs_to :user
  
  before_validation on: :create do
    # yandex_response = POST Credentials
    # if yandex_response is valid?
    #   yandex_response = POST success.xml
    #   error.add(:customerid, "") unless yandex_response is valid?
    # else
    #   error.add(:customerid, "") unless yandex_response is valid?
    # end
  end
  
  # protected
  
  def get_credentials_confirmation
		credentials = {
      shopId: 1,
      shopArticleId: 1,
      Sum: 123,
      BankId: 213235,
      scid: 123213,
      CustomerNumber: 45563766534
		}
		yandex_api_uri = URI(YANDEX_MONEY_API_HOST % 'request-payment')
		yandex_api_uri.query = URI.encode_www_form(credentials)
		Net::HTTP.get_response(yandex_api_uri)
  end
  
  def validate_yandex_credentials
    # response.xml
  end
  
  def send_success_to_yandex_api
    # POST success.xml
  end
end
