class AddAdminToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :admin, :boolean, default: false
  end
end

# Añado la columna de admin con valores voleanos y como va a haber uno o pocos más admin, genero por defecto
# booleanos falsos con la idea de que cuando tenga un admin lo haga true.
