class CoursesController < ApplicationController

  before_action :set_course, only: [:edit, :update, :show, :destroy]

  def index
    @course = Course.all
  end

  def new
    @course = Course.new

    respond_to do |format|     # como le he puesto un remote en el link de new subject, tenemos dos casuisticas:
      format.html              # el html de siempre, sin el remote en el link
      format.js                # generar un javascript con el formulario.
    end
  end

  def show
    #@course = Course.find(params[:id])
  end

  def edit
    #@course = Course.find(params[:id])
  end

  def create
    @course = Course.new(course_params)
    respond_to do |format|
      if @course.save
        format.html { redirect_to @course, notice: 'El nuevo curso ha sido creado' }
        format.js
        format.json { render json: @course, status: :created, location: @courses}
      else
        format.html { render action: "new" }
        format.json { render json: @course.errors, status: :unprocessable_entity }
      end
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
    params.require(:course).permit(:secondary, subject_ids: [], teacher_ids: [])
  end

  def set_course
    @course = Course.find(params[:id])  #esta línea se repetía en los métodos de arriba.
  end

end