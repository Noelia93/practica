# My Courses table has a Secondary columnn since it is possible I will add another column which name would be
# Primary

class CreateCourses < ActiveRecord::Migration[5.2]
  def change
    create_table :courses do |t|
      t. string :secondary
      t.timestamps
    end
  end
end

