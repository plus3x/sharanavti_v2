xml.instruct!
xml.checkOrderResponse(
  "performedDatetime" => @yandex_payment.created_at,
  "code" => @error_code,
  "invoiceId" => @yandex_payment.invoiceId,
  "shopId" => YandexMoney.shop_id
)