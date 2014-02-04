xml.instruct!
xml.checkOrderResponse(
  'performedDatetime' => @yandex_payment.created_at.iso8601 || Time.now.iso8601,
  'code' => @error_code || 0,
  'invoiceId' => @yandex_payment.invoiceId,
  'shopId' => YandexMoney.shop_id
)