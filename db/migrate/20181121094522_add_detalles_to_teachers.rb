class AddDetallesToTeachers < ActiveRecord::Migration[5.2]
  def change
    add_column :teachers, :responsibility, :string
  end
end
