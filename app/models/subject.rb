class Subject < ApplicationRecord
  has_many :subject_teachers
  has_many :teachers, through: :subject_teachers

  has_many :course_subjects
  has_many :courses, through: :course_subjects
end
