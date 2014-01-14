require 'sinatra'
require 'json'
require 'active_support/core_ext/hash/conversions'

# For ActiveResource::Schema
# GET /users/new
get '/users/new' do
  content_type :json
  { id: nil, name: nil, email: nil, password: nil }.to_json
end

# GET /users/find_by_email?email=user@mail.com
get '/users/find_by_email' do
  @client = { id: 1, name: 'Vasya', email: 'vasya@mail.com', password: 'secret' }
  if @client[:email] == params[:email]
    content_type :json
    @client.to_json
  else
    status 404
  end
end

# GET /users/1
get '/users/:id' do
  @client = { id: 1, name: 'Vasya', email: 'vasya@mail.com', password: 'secret' }
  if @client[:id] == params[:id].to_i
    content_type :json
    @client.to_json
  else
    status 404
  end
end

# GET /yandex_money/request-payment?{credentials}
get '/yandex_money/request-payment' do
  good_credentials = {
    shopId: 1,
    shopArticleId: 1,
    Sum: 123,
    BankId: 213235,
    scid: 123213,
    CustomerNumber: 45563766534
	}
  puts params
  content_type :xml
  {success: 'success'}.to_xml if good_credentials == params
end