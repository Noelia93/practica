class CoursesController < ApplicationController

  before_action :set_course, only: [:edit, :update, :show, :destroy]

  def index
    @course = Course.all
  end

  def new
    @course = Course.new
  end

  def show
    #@course = Course.find(params[:id])
  end

  def edit
    #@course = Course.find(params[:id])
  end

  def create
    @course = Course.new(course_params)
    if @course.save
      # do something
      flash[:success] = "El curso se ha añadido correctamente"  #cambio los flash success sale en verde
      redirect_to courses_path(@course)
    else
      render 'new'
    end
  end

  def update
    #@course = Course.find(params[:id])
    if @course.update(course_params)
      flash[:success] = "El curso se ha modificado correctamente"
      redirect_to course_path(@course)
    else
      render 'edit'
    end
  end

  def destroy
    #@course = Course.find(params[:id])
    @course.destroy
    flash[:danger] = "El curso ha sido eliminado"   #cambio los flash danger sale en rojo
    redirect_to courses_path
  end

  private

  def course_params
    params.require(:course).permit(:name)
  end

  def set_course
    @course = Course.find(params[:id])  #esta línea se repetía en los métodos de arriba.
  end

end