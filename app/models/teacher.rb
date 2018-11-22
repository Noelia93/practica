class Teacher < ApplicationRecord
  has_many :subject_teachers
  has_many :subjects, through: :subject_teachers

  has_many :course_teachers
  has_many :courses, through: :course_teachers

  belongs_to :department

  belongs_to :user

  validates :name, presence: true,
            uniqueness: { case_sensitive: false },
            length: { minimum: 3, maximum: 105 }
end
