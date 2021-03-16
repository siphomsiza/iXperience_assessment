class SignUpStepOne < ActiveType::Record[User]
  has_secure_password
  validates :first_name,:last_name, presence: true

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence:   true,
                    format:     { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }

  PASSWORD_REQUIREMENT_REGEX = /\A(?=.{8,})
                         (?=.*\d)
                         (?=.*[a-z])
                         /x
  validates :password, format:     { with: PASSWORD_REQUIREMENT_REGEX ,message: "minimum eight characters, at least one letter and one number"}
  validates :password_confirmation, presence: true
end
