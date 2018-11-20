# Me creo este controlado para manejar el login.
class SessionsController < ApplicationController

  # render a form
  def new

  end

  # lo que se hace en lo siguiente es para que cuando alguien va a entrar compuebe que el username esta registrado
  # y despues que la contraseña está bien de acuerdo a la que se introdujo en su momento.

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password_digest])
      session[:user_id] = user.id
      flash[:success] = "Sesión iniciada"
      redirect_to user_path(user)
    else
      flash.now[:danger] = "Usuario o contraseña incorrecta"
      render 'new'
    end
  end

  #for login out
  def destroy
    session[:user_id] = nil
    flash[:success] = "Sesión cerrada"
    redirect_to root_path
  end

end