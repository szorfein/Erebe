class Auth
  include Mongoid::Document
  field :domain, type: String
  field :rootmail, type: String
  field :firstname, type: String
  field :lastname, type: String
  field :created_at, type: Date
  field :token, type: String 
  
  has_many :user 
  
  validates :domain, uniqueness: true, presence: true
  validates :rootmail, uniqueness: true, email_format: true
  validates :token, uniqueness: true, presence: true
end
