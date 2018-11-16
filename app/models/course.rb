class Course < ApplicationRecord
  has_many :course_teachers
  has_many :teachers, through: :course_teachers

  has_many :course_subjects
  has_many :subjects, through: :course_subjects
end
