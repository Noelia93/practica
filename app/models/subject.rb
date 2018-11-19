class Subject < ApplicationRecord
  has_many :subject_teachers
  has_many :teachers, through: :subject_teachers

  has_many :course_subjects
  has_many :courses, through: :course_subjects

  #Añadrié más validaciones conforme lo vaya necesitando: p.ej que esté el usuario registrado.
  validates :name, presence:true, length: { minimum: 3, maximum: 50 }  #para que no haya asignaturas en blanco o inexistentes

end
