class CreateSubjectTeachers < ActiveRecord::Migration[5.2]
  def change
    create_table :subject_teachers do |t|
      t.belongs_to :teacher, index: true
      t.belongs_to :subject, index: true
    end
  end
end
