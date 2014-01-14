class User < ActiveResource::Base
  # schema do
  #   integer :id
  #   string :email, :name
  #   string :password
  # end
  
  def self.new(attributes = self.get(:new))
    super attributes
  end
  
  def self.find(id)
    get(id) rescue nil
  end
  
  def self.find_by_email(email)
    validate
    get(:find_by_email, email: email) rescue nil
  end
  
  protected
  
    def validate
      errors.add(:email, 'not avalible format') unless email.match(/\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/)
    end
end
