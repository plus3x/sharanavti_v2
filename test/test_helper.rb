ENV["RAILS_ENV"] ||= "test"
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'
require 'openssl'

class ActiveSupport::TestCase
  ActiveRecord::Migration.check_pending!

  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  #
  # Note: You'll currently still have to declare fixtures explicitly in integration tests
  # -- they do not yet inherit this setting
  fixtures :all

  # Add more helper methods to be used by all tests here...
  def login_as(user)
    session[:user_id] = user
  end

  def encrypt_for_yandex(data)
    application_certificate = OpenSSL::X509::Certificate.new(File.read('lib/certificates/Yandex.Money.crt'))
    store_certificate = OpenSSL::X509::Store.new
    store_certificate.add_cert(application_certificate)
    signed_data = OpenSSL::PKCS7::sign(application_certificate, nil, data, [], OpenSSL::PKCS7::BINARY)
    cypher = OpenSSL::Cipher::new(nil)
    encrypted_data = OpenSSL::PKCS7::encrypt([nil], signed_data.to_der, cypher, OpenSSL::PKCS7::BINARY)
    encrypted_data.to_s
  end
end
