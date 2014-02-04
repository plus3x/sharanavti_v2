require 'sinatra'
require 'json'
require 'active_support/core_ext/hash/conversions'

# GET /api/user.find.byemail?email=vasya@ya.ru
get '/api/user.find.byemail' do
  @client = { id: 1, name: 'Vasya', email: 'vasya@mail.com', password: 'secret' }
  if @client[:email] == params[:email]
    content_type :json
    @client.to_json
  else
    status 404
  end
end

# GET /api/user.find.byemail?id=122
get '/api/user.find.byid' do
  @client = { id: 1, name: 'Vasya', email: 'vasya@mail.com', password: 'secret' }
  if @client[:id] == params[:id].to_i
    content_type :json
    @client.to_json
  else
    status 404
  end
end