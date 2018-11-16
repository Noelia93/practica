class CreateCourseTeachers < ActiveRecord::Migration[5.2]
  def change
    create_table :course_teachers do |t|
      t.belongs_to :course, index: true
      t.belongs_to :teacher, index: true
    end
  end
end
