class UsersController < ApplicationController
  before_action :set_user, only: [:edit, :update, :show]

  before_action :require_same_user, only: [:edit, :update, :destroy]
  before_action :require_admin, only: [:destroy]

  def index
    @users = User.all
    #@users = User.paginate(page: params[:page], per_page: 5)  #uso pagination  || lo activaré cuando llegue el caso
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      #session[:user_id] = @user.id
      flash[:success] = "Bienvenido a Instituto Ficticio #{@user.username}"
      redirect_to user_path(@user)
    else
      render 'new'
    end
  end

  # con edit lo que crea es la página para poder editar usuario y contraseña
  def edit     #se fija en http://localhost:3000/users/5/edit  ese 5 es el id
    #@user = User.find(params[:id]) como hace la linea del ppo, quita esta
  end

  #con estas lineas conseguimos que cuando se escriban los datos de la edicion se guarden
  def update
    #@user = User.find(params[:id]) tb lo quita después de la linea de arriba
    if @user.update(user_params) #user_params es username, mail y password esta def abajo en private
      flash[:success] = "Tu perfil ha sido creado correctamente"
      redirect_to courses_path
    else
      render 'edit'
    end
  end

  def show
    @user = User.find(params[:id])
    #@user_articles = @user.articles.paginate(page: params[:page], per_page: 5)
  end

  #El admin puede hacerlo
  def destroy
    @user = User.find(params[:id])
    @user.destroy
    flash[:danger] = "Perfil eliminado"
    redirect_to users_path
  end

  private
  def user_params
    params.require(:user).permit(:username, :email, :password, :teacher_id)
  end

  def set_user
    @user = User.find(params[:id])
  end

  def require_same_user
    if current_user != @user and !current_user.admin?    #permiso admin
      flash[:danger] = "Sólo puedes editar tu propio perfil"
      redirect_to root_path
    end
  end

  def require_admin
    if logged_in? and !current_user.admin?
      flash[:danger]= "Permitido solo al administrador"
      redirect_to root_path
    end
  end

end



#esto es para la parte de signup. Me creo la variable user para poder usarla en ew.html.erb por ejemplo.


