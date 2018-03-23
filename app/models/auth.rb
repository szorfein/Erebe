class Auth
  include Mongoid::Document
  field :domain, type: String
  field :rootmail, type: String
  field :firstname, type: String
  field :lastname, type: String
  field :createdAt, type: Date
  field :token, type: String 
  
  has_many :user 
  
  validates :domain, uniqueness: true
  validates :rootmail, uniqueness: true, email_format: true
  validates :auth_token, uniqueness: true
end
