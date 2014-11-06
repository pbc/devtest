module PrivateApiAuthentication
  extend ActiveSupport::Concern
  included do 
    http_basic_authenticate_with(name: "zappistore", password: "123456") 
  end
end