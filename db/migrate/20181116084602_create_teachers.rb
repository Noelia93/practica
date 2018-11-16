# My table has a column with teachers' name

class CreateTeachers < ActiveRecord::Migration[5.2]
  def change
    create_table :teachers do |t|
      t.string :name
      t.timestamps
    end
  end
end
