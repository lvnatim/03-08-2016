class Teacher < ActiveRecord::Base

  has_many :students
  validates :name,
    presence: true,
    uniqueness: true
  validates :email,
    presence: true,
    uniqueness: true
  validate :retired_after_hired

  after_save :remove_current_students, if: :retired?

  def retired_after_hired
    if retirement_date
      errors.add(:hire_date, "Must be a hired date before a retirement date is added!") unless hire_date
      return false unless hire_date
      errors.add(:retirement_date, "Retirement date must be after hire date!") if retirement_date < hire_date
      errors.add(:retirement_date, "Retirement date can't be in the future!") if retirement_date > Date.today
    end
  end

  def remove_current_students
    puts "removing current students"
    students.each do |student|
      student.update_columns(teacher_id: nil)
    end
  end

  def days_employed
    if hire_date && retirement_date
      retirement_date - hire_date
    elsif hire_date
      Date.today - hire_date
    else
      nil
    end
  end

  def retired?
    retirement_date ? true : false
  end

end