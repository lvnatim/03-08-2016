require_relative 'spec_helper'

describe Teacher do 

  describe ".new" do
    it "should have unique values for name and email." do
      teacher_1 = Teacher.create!(name: "AYYYYYYLMAO", email: "joe@joe.com")
      teacher_2 = Teacher.new(name: "AYYYYYYLMAO", email: "joe@joe.com")
      expect(teacher_2).not_to be_valid
    end

    it "should insert a row for a valid name and email" do
      teacher_3 = Teacher.create(name: "Tim", email: "tim_lu@ourlog.a")
      expect(Teacher.find_by(name: "Tim")).not_to be_nil
    end

    context "date validation" do

      before :each do
        @teacher = Teacher.new(name: "Tim Lu", email: "Tim.lu@ourlog.ca")
        @student = Student.create(first_name: 'Kreay',
        last_name: 'Shawn',
        birthday: Date.new(1989, 9, 24),
        gender: 'female',
        email: 'kreayshawn@oaklandhiphop.net',
        phone: '(510) 555-1212 x4567'
      )
      end


      it "should not validate when retirement date is before the hire date" do
        @teacher.hire_date = Date.today - 3.years
        @teacher.retirement_date = Date.today - 4.years
        expect(@teacher).not_to be_valid
      end

      it "should require a hire_date before a retirement_date is given" do
        @teacher.retirement_date = Date.today - 3.years
        expect(@teacher).not_to be_valid
      end

      it "shouldn't allow retirement dates in the future" do
        @teacher.retirement_date = Date.today + 3.years
        expect(@teacher).not_to be_valid
      end

      it "should evaluate all associated teacher_ids to nil when a retirement date is set." do
        teacher = @teacher
        teacher.hire_date = Date.today - 3.years
        teacher.save
        @student.teacher = teacher
        expect(@student.teacher_id).not_to be_nil
        teacher.retirement_date = Date.today
        teacher.save
        @student.reload
        expect(@student.teacher_id).to be_nil
      end

    end

  end


end