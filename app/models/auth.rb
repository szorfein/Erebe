class Auth
  include Mongoid::Document
  field :domain, type: String
  field :rootmail, type: String
  field :firstname, type: String
  field :lastname, type: String
  field :created_at, type: Date
  field :token, type: String 
  field :ip_addr, type: String 
  field :isPrimalInstance, type: Boolean
  
  has_many :user 
  has_many :homemsg
  
  validates :domain, uniqueness: true, presence: true
  validates :rootmail, uniqueness: true, email_format: true
  validates :token, uniqueness: true, presence: true
  validates :ip_addr, uniqueness: true, presence: true
  validates :isPrimalInstance, presence: true

end
