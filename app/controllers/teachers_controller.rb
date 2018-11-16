class TeachersController < ApplicationController

  def create
    @teacher = Teacher.new(teacher_params)
  end

  private

  def teacher_params
    params.require(:teacher).permit(:name, :last_name)
  end

end