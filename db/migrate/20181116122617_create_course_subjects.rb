class CreateCourseSubjects < ActiveRecord::Migration[5.2]
  def change
    create_table :course_subjects do |t|
      t.belongs_to :course, index: true
      t.belongs_to :subject, index: true
    end
  end
end
