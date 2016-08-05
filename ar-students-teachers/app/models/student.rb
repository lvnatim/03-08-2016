class Student < ActiveRecord::Base
  
  belongs_to :teacher
  validates :email,
    presence: true,
    uniqueness: true
  validate :email_must_be_valid
  validate :not_a_toddler
  validate :teacher_must_be_unretired

  after_save :update_last_student_added, if: :teacher 

  def update_last_student_added
    teacher.last_student_added_at = Date.today
    teacher.save
  end

  def age
    now = Date.today
    now.year - birthday.year - ( (now.month > birthday.month && now.day > birthday.day) ? 0 : 1 )
  end

  def name
    "#{first_name} #{last_name}"
  end

  private

    def email_must_be_valid
      errors.add(:email, "Email must be valid!") unless /\w+@(\w+\.)+\w{2,}/.match(email)
    end

    def not_a_toddler
      errors.add(:birthday, "Must be older than 3!") unless age > 3
    end

    def teacher_must_be_unretired
      return unless teacher_id
      errors.add(:teacher_id, "ID must be that of a teacher that isn't retired!") if Teacher.find(teacher_id).retirement_date
    end

end
