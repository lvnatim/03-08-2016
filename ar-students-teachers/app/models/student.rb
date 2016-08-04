class Student < ActiveRecord::Base
  
  belongs_to :teacher
  validates :email,
    presence: true,
    uniqueness: true
  validate :email_must_be_valid
  validate :not_a_toddler

  def age
    now = Date.today
    now.year - birthday.year - ( (now.month > birthday.month && now.day > birthday.day) ? 0 : 1 )
  end

  def name
    "#{first_name} #{last_name}"
  end

  def email_must_be_valid
    errors.add(:email, "Email must be valid!") unless /\w+@(\w+\.)+\w{2,}/.match(email)
  end

  def not_a_toddler
    errors.add(:birthday, "Must be older than 3!") unless age > 3
  end
end
