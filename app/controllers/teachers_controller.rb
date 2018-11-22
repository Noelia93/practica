class TeachersController < ApplicationController

  before_action :set_teacher, only: [:edit, :update, :show, :destroy]

  def index
    @teacher = Teacher.all
  end

  def new
    @teacher = Teacher.new
  end

  def show
    #@teacher = Teacher.find(params[:id])
  end

  def edit
    #@teacher = Teacher.find(params[:id])
  end

  def create
    @teacher = Teacher.new(teacher_params)
    if @teacher.save
      # do something
      flash[:success] = "El nombre del profesor se ha añadido correctamente"  #cambio los flash success sale en verde
      redirect_to teachers_path(@teacher)
    else
      render 'new'
    end
  end

  def update
    #@teacher = Teacher.find(params[:id])
    if @teacher.update(teacher_params)
      flash[:success] = "El nombre del profesor se ha modificado correctamente"
      redirect_to teacher_path(@teacher)
    else
      render 'edit'
    end
  end

  def destroy
    #@teacher = Teacher.find(params[:id])
    @teacher.destroy
    flash[:danger] = "El profesor ha sido eliminado"   #cambio los flash danger sale en rojo
    redirect_to teachers_path
  end

  private

  def teacher_params
    params.require(:teacher).permit(:name, :responsibility, :department_id, :user_id, course_ids: [], subject_ids: [])
  end

  def set_teacher
    @teacher = Teacher.find(params[:id])  #esta línea se repetía en los métodos de arriba.
  end

end