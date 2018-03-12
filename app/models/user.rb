class User
  include Mongoid::Document
  authenticates_with_sorcery!

  validates :username, presence: true, uniqueness: true
  validates :password, length: { minimum: 8 }, on: :create
  validates :email, uniqueness: true, email_format: true
end
