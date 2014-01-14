json.array!(@yandex_moneys) do |yandex_money|
  json.extract! yandex_money, :id, :user_id, :customerid, :sum, :gems, :invoiceid
  json.url yandex_money_url(yandex_money, format: :json)
end
