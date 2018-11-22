class DepartmentsController < ApplicationController

  before_action :set_department, only: [:edit, :update, :show, :destroy]

  def index
    @department = Department.all
  end

  def new
    @department = Department.new

    respond_to do |format|     # como le he puesto un remote en el link de new subject, tenemos dos casuisticas:
      format.html              # el html de siempre, sin el remote en el link
      format.js                # generar un javascript con el formulario.
    end
  end

  def show
  end

  def edit
  end

  def create
    @department = Department.new(department_params)
    respond_to do |format|
      if @department.save
        format.html { redirect_to @department, notice: 'El departamento ha sido creado correctamente' }
        format.js
        format.json { render json: @department, status: :created, location: @users}
      else
        format.html { render action: "new" }
        format.json { render json: @department.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    if @department.update(department_params)
      flash[:success] = "El departamento se ha modificado correctamente"
      redirect_to department_path(@department)
    else
      render 'edit'
    end
  end

  def destroy
    @department.destroy
    flash[:danger] = "El departamento ha sido eliminado"   #cambio los flash danger sale en rojo
    redirect_to departments_path
  end


  private

  # Aquí defino métodos para pasar parámetros en el primer caso, para ahorrar código en el segundo.
  def department_params
    params.require(:department).permit(:name, teacher_ids: [])
  end

  def set_department
    @department = Department.find(params[:id])  #esta línea se repetía en los métodos de arriba.
  end

end