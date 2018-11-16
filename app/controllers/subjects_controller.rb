#Desde el controlador me voy creando mis metodos poco a poco juntos con los html. Lo primero que hago es irme
# al fichero de routes para añadir en este caso resources routes :subjects y esto me genera lo que necesito para los
# links.

class SubjectsController < ApplicationController

  def index
    @subject = Subject.all
  end

  def new
    @subject = Subject.new
  end

  def show
    @subject = Subject.find(params[:id])
  end

  def edit
    @subject = Subject.find(params[:id])
  end

  def create
    @subject = Subject.new(subject_params)
  end

  private

  def subject_params
    params.require(:subject).permit(:name)
  end

end