class DepartmentsController < ApplicationController

  before_action :set_department, only: [:edit, :update, :show, :destroy]

  def index
    @department = Department.all
  end

  def new
    @department = Department.new
  end

  def show
  end

  def edit
  end

  def create
    @department = Department.new(department_params)
    if @department.save
      # do something
      flash[:success] = "El departamento se ha añadido correctamente"  #cambio los flash success sale en verde
      redirect_to departments_path(@department)
    else
      render 'new'
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
    params.require(:department).permit(:name)
  end

  def set_department
    @department = Department.find(params[:id])  #esta línea se repetía en los métodos de arriba.
  end

end