class CreateDepartmentTeachers < ActiveRecord::Migration[5.2]
  def change
     add_column :teachers, :department_id, :bigint
  end
end
