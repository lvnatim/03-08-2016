class CreateStudents < ActiveRecord::Migration
  
  def change
    # Add code to create the table here
    # HINT: check out ActiveRecord::Migration.create_table
    create_table :students do |column_name|
      # column definitions go here
      # Use the AR migration guide for syntax reference
      column_name.string :first_name
      column_name.string :last_name
      column_name.string :gender
      column_name.string :email
      column_name.string :phone
      column_name.date :birthday
      column_name.timestamps
    end
  end

end
