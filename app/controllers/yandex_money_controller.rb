class YandexMoneyController < ApplicationController
  skip_before_action :authorize
  respond_to :xml
  
  # Check user order from Yandex.Money
  # POST /yandex_money/check_order
  def check_order
    # in credentials
    # output xml success
    respond_with success: 'true'
  end
  
  # Yandex.Money send payment done
  # POST /yandex_money/payment_done
  def payment_done
    # in credentials
    # Logging
    # output xml success
    respond_with success: 'true'
  end
end
