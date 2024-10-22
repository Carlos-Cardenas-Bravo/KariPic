# Crear un usuario administrador
admin_email = 'admin@admin.com'
admin_password = '123456'

if User.exists?(email: admin_email)
  puts "El usuario administrador con el email #{admin_email} ya existe."
else
  admin = User.create!(
    name: "Carlos",
    email: admin_email,
    password: admin_password,
    password_confirmation: admin_password,
    role: :admin
  )
  puts "Usuario administrador creado con email: #{admin.email}"
end

