class User
  include Mongoid::Document
  #include Mongoid::Timestamps
  authenticates_with_sorcery!

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
end
