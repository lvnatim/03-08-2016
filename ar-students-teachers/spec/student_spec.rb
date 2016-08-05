require_relative 'spec_helper'

describe Student do
  before(:all) do
    raise RuntimeError, "be sure to run 'rake db:migrate' before running these specs" unless ActiveRecord::Base.connection.table_exists?(:students)
  end

  context '#name and #age' do
    before(:each) do
      @student = Student.new
      @student.assign_attributes(
        first_name: 'Happy',
        last_name: 'Gilmore',
        gender: 'male',
        birthday: Date.new(1970, 9, 1)
      )
    end

    it 'should have name and age methods' do
      [:name, :age].each { |method| expect(@student).to respond_to(method) }
    end

    it 'should concatenate first and last name' do
      expect(@student.name).to eq('Happy Gilmore')
    end

    it 'should be the right age' do
      now = Date.today
      age = now.year - @student.birthday.year - ((now.month > @student.birthday.month || (now.month == @student.birthday.month && now.day >= @student.birthday.day)) ? 0 : 1)
      expect(@student.age).to eq(age)
    end
  end

  context 'validations' do
    before(:each) do
      @student = Student.new
      @student.assign_attributes(
        first_name: 'Kreay',
        last_name: 'Shawn',
        birthday: Date.new(1989, 9, 24),
        gender: 'female',
        email: 'kreayshawn@oaklandhiphop.net',
        phone: '(510) 555-1212 x4567'
      )
    end

    it 'should accept valid info' do
      expect(@student).to be_valid
    end

    it "shouldn't accept invalid emails" do
      ['XYZ!bitnet', '@.', 'a@b.c'].each do |address|
        @student.assign_attributes(email: address)
        expect(@student).to_not be_valid
      end
    end

    it 'should accept valid emails' do
      ['joe@example.com', 'info@bbc.co.uk', 'bugs@facebook.com'].each do |address|
        @student.assign_attributes(email: address)
        expect(@student).to be_valid
      end
    end

    it "shouldn't accept toddlers" do
      @student.assign_attributes(birthday: Date.today - 3.years)
      expect(@student).to_not be_valid
    end

    it "shouldn't allow two students with the same email" do
      Student.create!(
        birthday: @student.birthday,
        email: @student.email,
        phone: @student.phone
      )
      expect(@student).to_not be_valid
    end

    it "shouldn't have a teacher id of a teacher that is retired!" do
      teacher = Teacher.create!(
        name: "Tim Lu",
        email: "Joe@joe.com",
        hire_date: Date.today - 3.years,
        retirement_date: Date.today
      )
      @student.teacher = teacher
      expect(@student).not_to be_valid
    end
  end

  context 'callbacks' do

    before(:each) do
      @teacher = Teacher.create(name: "Joe", email: "Joe@joe.com")
      @student = Student.new(
        first_name: 'Kreay',
        last_name: 'Shawn',
        birthday: Date.new(1989, 9, 24),
        gender: 'female',
        email: 'kreayshawn@oaklandhiphop.net',
        phone: '(510) 555-1212 x4567'
      )
    end

    it "should update the teachers last_student_added_at column every time a student is saved." do 
      expect(@teacher.last_student_added_at).to be_nil
      @student.teacher = @teacher
      @student.save
      expect(@teacher.last_student_added_at).to eq(Date.today)
    end


  end














end
