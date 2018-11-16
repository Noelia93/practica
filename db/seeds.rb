# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)



#  INFORMACIÓN SACADA DE: http://padremanjongranada.wixsite.com/colegiopadremanjon/oferta-educativa


###############################  meto tablas #################################################

=begin
#  TABLA PARA ASIGNATURAS

subject = Subject.new(name: "Religión")
subject.save

subject = Subject.new(name: "Lengua")
subject.save

subject = Subject.new(name: "Cultura Clásica")
subject.save

subject = Subject.new(name: "Filosofía")
subject.save

subject = Subject.new(name: "Ed. Física")
subject.save

subject = Subject.new(name: "Act. Física y Salud")
subject.save

subject = Subject.new(name: "Libre disposición")
subject.save

subject = Subject.new(name: "Geografía e Historia")
subject.save

subject = Subject.new(name: "Biología y Geología")
subject.save

subject = Subject.new(name: "Matemáticas")
subject.save

subject = Subject.new(name: "Física y Química")
subject.save

subject = Subject.new(name: "Tecnología")
subject.save

subject = Subject.new(name: "Tecnología de la Información y Comunicación")
subject.save

subject = Subject.new(name: "Pástica y Visual")
subject.save

subject = Subject.new(name: "Dibujo Técnico")
subject.save

subject = Subject.new(name: "Fotografía")
subject.save

subject = Subject.new(name: "Ciudadanía")
subject.save

subject = Subject.new(name: "Cambios Sociales")
subject.save

subject = Subject.new(name: "Música")
subject.save

subject = Subject.new(name: "Francés")
subject.save

subject = Subject.new(name: "Inglés")
subject.save
=end

=begin   TABLE DE CURSOS
Este código es para hacerlo por aquí en vez de mano a mano en rails console. Me ahorra tiempo.
course = Course.new(secondary: "Primero")
course.save

course = Course.new(secondary: "Segundo")
course.save

course = Course.new(secondary: "Tercero")
course.save

course = Course.new(secondary: "Cuarto")
course.save
=end

=begin
#   TABLA DE PROFESORES: NOMBRE, APELLIDOS:
teacher = Teacher.new(name: "Ángel Barragán")
teacher.save

teacher = Teacher.new(name: "Javier Gutiérrez")
teacher.save

teacher = Teacher.new(name: "Jose Manuel Arena")
teacher.save

teacher = Teacher.new(name: "Enrique Santana")
teacher.save

teacher = Teacher.new(name: "Javier Velasco")
teacher.save

teacher = Teacher.new(name: "Cristina Ontiveros")
teacher.save

teacher = Teacher.new(name: "Felisa Ortega")
teacher.save

teacher = Teacher.new(name: "Mª Carmen Martín")
teacher.save

teacher = Teacher.new(name: "Alberto Pérez")
teacher.save

teacher = Teacher.new(name: "Jorge Ríos")
teacher.save

teacher = Teacher.new(name: "Mª Carmen Vallano")
teacher.save

teacher = Teacher.new(name: "Maribel Gómez")
teacher.save

teacher = Teacher.new(name: "Miguel Ángel Rosúa")
teacher.save
=end


################################## Meto asociaciones ######################################


######################### ASIOCIACIÓN PROFESORES Y ASIGNATURAS ############################

=begin
#empiezo desde 3 porque los dos primeros ya los he metido
for i in (3..4)
  teacher = Teacher.find(1)
  teacher.save
  subject = Subject.find(i)
  subject.save
  teacher.subjects << subject
end
=end

=begin
for i in (5..7)
  teacher = Teacher.find(2)
  teacher.save
  subject = Subject.find(i)
  subject.save
  teacher.subjects << subject
end

  teacher = Teacher.find(3)
  teacher.save
  subject = Subject.find(8)
  subject.save
  teacher.subjects << subject

for i in (12..13)
  teacher = Teacher.find(5)
  teacher.save
  subject = Subject.find(i)
  subject.save
  teacher.subjects << subject
end

  teacher = Teacher.find(6)
  teacher.save
  subject = Subject.find(2)  #lengua
  subject.save
  teacher.subjects << subject
  subject = Subject.find(22)  #latin
  subject.save
  teacher.subjects << subject

for i in (14..16)
  teacher = Teacher.find(7)
  teacher.save
  subject = Subject.find(i)
  subject.save
  teacher.subjects << subject
end
  subject = Subject.find(7)
  subject.save
  teacher.subjects << subject

  teacher = Teacher.find(8)
  teacher.save
  subject = Subject.find(2)
  subject.save
  teacher.subjects << subject
  subject = Subject.find(8)  #Geografía e historia
  subject.save
  teacher.subjects << subject
  subject = Subject.find(17)  #Ciudadanía
  subject.save
  teacher.subjects << subject
  subject = Subject.find(3)  # Cultura clásica
  subject.save
  teacher.subjects << subject
  subject = Subject.find(18)  #Cambios sociales
  subject.save
  teacher.subjects << subject

for i in (10..11)
  teacher = Teacher.find(9)
  teacher.save
  subject = Subject.find(i)
  subject.save
  teacher.subjects << subject
end

  teacher = Teacher.find(10)
  teacher.save
  subject = Subject.find(19)
  subject.save
  teacher.subjects << subject

  teacher = Teacher.find(11)
  teacher.save
  subject = Subject.find(20)
  subject.save
  teacher.subjects << subject
  subject = Subject.find(21)
  subject.save
  teacher.subjects << subject

  teacher = Teacher.find(12)
  teacher.save
  subject = Subject.find(21)
  subject.save
  teacher.subjects << subject

  teacher = Teacher.find(13)
  teacher.save
  subject = Subject.find(9)
  subject.save
  teacher.subjects << subject
  subject = Subject.find(11)
  subject.save
  teacher.subjects << subject
=end

=begin
for i in (9..11)
  teacher = Teacher.find(4)
  teacher.save
  subject = Subject.find(i)
  subject.save
  teacher.subjects << subject
end
=end

################################# ASOCIO CURSO CON PROFESOR ####################################


=begin
  teacher = Teacher.find(2)
  teacher.save
  teacher.courses << [Course.find(1), Course.find(2),Course.find(3),Course.find(4)]

  teacher = Teacher.find(5)
  teacher.save
  teacher.courses << [Course.find(1), Course.find(2),Course.find(3),Course.find(4)]

  teacher = Teacher.find(7)
  teacher.save
  teacher.courses << [Course.find(1), Course.find(2),Course.find(3),Course.find(4)]

  teacher = Teacher.find(11)
  teacher.save
  teacher.courses << [Course.find(1), Course.find(2),Course.find(3),Course.find(4)]

  teacher = Teacher.find(13)
  teacher.save
  teacher.courses << [Course.find(1), Course.find(2),Course.find(3),Course.find(4)]

  teacher = Teacher.find(3)
  teacher.save
  teacher.courses << [Course.find(1), Course.find(2), Course.find(3)]

  teacher = Teacher.find(4)
  teacher.save
  teacher.courses << [Course.find(2), Course.find(3), Course.find(4)]

  teacher = Teacher.find(8)
  teacher.save
  teacher.courses << [Course.find(2), Course.find(3), Course.find(4)]

  teacher = Teacher.find(6)
  teacher.save
  teacher.courses << [Course.find(2), Course.find(3), Course.find(4)]

  teacher = Teacher.find(9)
  teacher.save
  teacher.courses << [Course.find(1), Course.find(3), Course.find(4)]

  teacher = Teacher.find(12)
  teacher.save
  teacher.courses << [Course.find(1), Course.find(3), Course.find(4)]

  teacher = Teacher.find(10)
  teacher.save
  teacher.courses << [Course.find(1), Course.find(2)]
=end


################## ASOCIACIÓN ENTRE CURSOS Y ASIGNATURAS ######################

=begin
i = 1
for i in (1..4)
  course = Course.find(i)
  course.save
  course.subjects << [Subject.find(1), Subject.find(2), Subject.find(5), Subject.find(8), Subject.find(10),
                      Subject.find(12), Subject.find(14), Subject.find(20), Subject.find(21)]
end


course = Course.find(1)
course.save
course.subjects << [Subject.find(6), Subject.find(7), Subject.find(9), Subject.find(19)]

course = Course.find(2)
course.save
course.subjects << [Subject.find(16), Subject.find(18), Subject.find(11), Subject.find(19)]

course = Course.find(3)
course.save
course.subjects << [Subject.find(3), Subject.find(7), Subject.find(9), Subject.find(11), Subject.find(17)]

course = Course.find(4)
course.save
course.subjects << [Subject.find(4), Subject.find(9), Subject.find(13), Subject.find(15), Subject.find(22)]
=end































