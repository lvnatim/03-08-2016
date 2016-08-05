class AddTeacherColumn < ActiveRecord::Migration

  def change
    change_table :teachers do |column_type|
      column_type.date :last_student_added_at
    end
  end

end