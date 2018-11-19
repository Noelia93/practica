# Desde el controlador me voy creando mis metodos poco a poco junto con los html. Lo primero que hago es irme
# al fichero de routes para añadir en este caso resources routes :subjects y esto me genera lo que necesito para los
# links.

class SubjectsController < ApplicationController

  before_action :set_subject, only: [:edit, :update, :show, :destroy]

  def index
    @subject = Subject.all
  end

  def new
    @subject = Subject.new
  end

  def show
    #@subject = Subject.find(params[:id])
  end

  def edit
    #@subject = Subject.find(params[:id])
  end

  def create
    @subject = Subject.new(subject_params)
    if @subject.save
      # do something
      flash[:success] = "La asignatura se ha añadido correctamente"  #cambio los flash success sale en verde
      redirect_to subjects_path(@subject)
    else
      render 'new'
    end
  end

  def update
    #@subject = Subject.find(params[:id])
    if @subject.update(subject_params)
      flash[:success] = "La asignatura se ha modificado correctamente"
      redirect_to subject_path(@subject)
    else
      render 'edit'
    end
  end

  def destroy
    #@subject = Subject.find(params[:id])
    @subject.destroy
    flash[:danger] = "La asignatura ha sido eliminada"   #cambio los flash danger sale en rojo
    redirect_to subjects_path
  end


  private

  # Aquí defino métodos para pasar parámetros en el primer caso, para ahorrar código en el segundo.
  def subject_params
    params.require(:subject).permit(:name, course_ids: [], teacher_ids: [])
  end

  def set_subject
    @subject = Subject.find(params[:id])  #esta línea se repetía en los métodos de arriba.
  end

end