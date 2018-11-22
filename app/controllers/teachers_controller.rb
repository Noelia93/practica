class TeachersController < ApplicationController

  before_action :set_teacher, only: [:edit, :update, :show, :destroy]

  def index
    @teacher = Teacher.all
  end

  def new
    @teacher = Teacher.new

    respond_to do |format|     # como le he puesto un remote en el link de new subject, tenemos dos casuisticas:
      format.html              # el html de siempre, sin el remote en el link
      format.js                # generar un javascript con el formulario.
    end
  end

  def show
    #@teacher = Teacher.find(params[:id])
  end

  def edit
    #@teacher = Teacher.find(params[:id])
  end

  def create
    @teacher = Teacher.new(teacher_params)
    respond_to do |format|
      if @teacher.save
        format.html { redirect_to @teacher, notice: 'El perfil se ha creado correctamente' }
        format.js
        format.json { render json: @teacher, status: :created, location: @teacher}
      else
        format.html { render action: "new" }
        format.json { render json: @teacher.errors, status: :unprocessable_entity }
      end
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



  #ajax
  #    formularios con ajax: primero me vengo al controlador de donde esté el formulario y modifico los metodos
  #    ne w y create. despues me creo un new.js.erb y un create.js.erb donde añado el codigo que tengo
  #    en este proyecto custumers es el nombre de la tabla en la que aparece la info de donde se ha realizado
  #    el cuestionario. Tb saber que antes de tocar estos archivos debo poner remote en los link donde abajo aparecera
  #    el formulario
