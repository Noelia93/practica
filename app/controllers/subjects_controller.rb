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

    respond_to do |format|     # como le he puesto un remote en el link de new subject, tenemos dos casuisticas:
      format.html              # el html de siempre, sin el remote en el link
      format.js                # generar un javascript con el formulario.
    end
  end

  def show
    #@subject = Subject.find(params[:id])
  end

  def edit
    #@subject = Subject.find(params[:id])
  end

  def create
    @subject = Subject.new(subject_params)
    respond_to do |format|
      if @subject.save
        format.html { redirect_to @subject, notice: 'La asignatura se ha añadido correctamente' }
        format.js
        format.json { render json: @subject, status: :created, location: @subjects}
        #redirect_to subjects_path(@subject)
      else
        format.html { render action: "new" }
        format.json { render json: @subject.errors, status: :unprocessable_entity }
      end
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