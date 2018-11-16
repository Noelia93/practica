class CoursesController < ApplicationController

  def create
    @course = Course.new(course_params)
  end

  private

  def course_params
    params.require(:course).permit(:secondary)
  end

end