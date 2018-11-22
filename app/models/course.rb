class Course < ApplicationRecord
  has_many :course_teachers
  has_many :teachers, through: :course_teachers

  has_many :course_subjects
  has_many :subjects, through: :course_subjects

  validates :secondary, presence:true, length: { minimum: 3, maximum: 50 }  #para que no haya cursos en blanco o inexistentes
end
