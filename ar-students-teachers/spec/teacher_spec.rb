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
  end


end