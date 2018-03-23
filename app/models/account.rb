class Account
  include Mongoid::Document

  belongs_to :user

  field :picture, type: String
end
