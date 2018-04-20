class Homemsg
  include Mongoid::Document
  include Token

  field :title, type: String
  field :message, type: String
  field :created_at, type: Date
  field :class_page, type: String

  belongs_to :auth

  validates :title, presence: true
  validates :message, presence: true

  validates :token, acceptance: true
  before_validation :removeToken
end
