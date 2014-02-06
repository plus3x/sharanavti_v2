class User < ActiveResource::Base

  # schema do
  #   integer :id
  #   string :email, :name
  #   string :password
  # end
  
  class << self

    def new(attributes = self.get(:new))
      super attributes
    end

    def find_by(hash)
      case hash.keys[0]
      when :id
        find_by_id hash.values[0]
      when :email
        find_by_email hash.values[0]
      else
        nil
      end
    end

    def find_by_id(id)
      GameAPI.user_find_by_id( id: id ) rescue nil
    end
    alias_method :find, :find_by_id

    def find_by_email(email)
      validate email
      GameAPI.user_find_by_email( email: email ) rescue nil
    end

  end
  
  protected

    def validate(email)
      errors.add(:email, 'not avalible format') unless email.match(/\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/)
    end
end
