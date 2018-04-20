class User
  include Mongoid::Document
  include Token
  #include Mongoid::Timestamps
  authenticates_with_sorcery!

  has_one :account
  belongs_to :auth

  validates :username,
      uniqueness: true,
      length: { minimum: 3 }

  validates :email, 
      uniqueness: true, 
      email_format: true

  validates :password,
      confirmation: true,
      length: { minimum: 8 },
      if: -> { new_record? || changes[:crypted_password] }

  validates :password_confirmation,
      presence: true,
      if: -> { new_record? || changes[:crypted_password] }

    # hack to use virtual field
  validates :token, acceptance: true
  before_validation :removeToken

end
