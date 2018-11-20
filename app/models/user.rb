class User < ApplicationRecord

  before_save { self.email = email.downcase }   # Antes de guardar hago minúsculas para evitar errores.
  #Le hago una serie de validaciones, por ejemplo que el campo username sea obligatorio rellenar
  validates :username, presence: true,
            uniqueness: { case_sensitive: false },
            length: { minimum: 3, maximum: 25 }
  VALID_EMAIL_REGEX= /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i     #regular expression look at rubular.com
  validates :email, presence: true,
            uniqueness: { case_sensitive: false },
            length: { maximum: 105 },
            format: { with: VALID_EMAIL_REGEX }
  has_secure_password   #es el método que debo usar para contraseñas
end

# The last code validate username which must be present and unique. In this case with case_sensitive: false, it will
# do distintion between capital letters.
