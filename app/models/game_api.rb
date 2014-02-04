class GameAPI < ActiveResource::Base
  self.element_name = 'api'
  self.logger = Logger.new("#{Rails.root}/log/game_api_#{Rails.env}.log")

  def self.user_find_by_email(args)
      get 'user.find.byemail', email: args[:email]
    rescue
     nil
  end

  def self.user_find_by_id(args)
      get 'user.find.byid', id: args[:id]
    rescue
     nil
  end
end
