class Timetable < ApplicationRecord

  has_many :teacher_timetables
  has_many :teachers, through: :teacher_timetables

end
