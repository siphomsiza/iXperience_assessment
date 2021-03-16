class SignUpStepTwo < ActiveType::Record[User]
  validates :gender, presence: true
  validates :gender, inclusion: { in: %w(Male Female Non-binary),
                     message: "%{value} is not a valid gender" }
  validates :birthday,:university ,presence: true
  validates :birthday, format: { with: /^\d{4}-\d{2}-\d{2}$/, multiline: true }
  validate :validate_age

  private
  def validate_age
    if birthday.present? && birthday < 150.years.ago.to_date
      errors.add(:birthday, "#{birthday} should be lessthan 150 years old.")
    end
  end
end
