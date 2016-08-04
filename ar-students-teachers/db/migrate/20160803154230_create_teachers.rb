class CreateTeachers < ActiveRecord::Migration

  def change
    create_table :teachers do | column_name |
      column_name.string :name
      column_name.string :email
      column_name.string :address
      column_name.string :phone
    end
  end

end