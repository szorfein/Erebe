class User
  include Mongoid::Document
  #include Mongoid::Timestamps
  #include ActiveModel::SecurePassword
  authenticates_with_sorcery!

  #field :password_digest

  validates :username, uniqueness: true, on: :create
  validates :email, uniqueness: true, email_format: true
  
  #has_secure_password
end
