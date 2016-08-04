class UpdateTeachers < ActiveRecord::Migration

  def change
    change_table :students do | col |
      col.belongs_to :teacher, foreign_key: true
    end
  end

end