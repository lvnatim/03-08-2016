class AddTeacherDates < ActiveRecord::Migration

  def change
    change_table :teachers do |column_type|
      column_type.date :hire_date
      column_type.date :retirement_date
    end
  end

end