require 'faker'
require 'open-uri'

=begin
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
=end


admin = User.find_by(email: 'admin@admin.com')

if admin
  # asigno una imagen de perfil al administrador
  if admin.profile_image.attached?
    puts "El administrador ya tiene una imagen de perfil."
  else
    file = URI.open("https://picsum.photos/200/200")
    admin.profile_image.attach(io: file, filename: "profile_image.jpg", content_type: "image/jpg")
    puts "Imagen de perfil asignada al administrador."
  end

  # cargo 20 fotos
  20.times do
    photo = admin.photos.build(
      caption: Faker::Lorem.sentence(word_count: 5)
    )

    file = URI.open("https://picsum.photos/800/600")
    photo.image.attach(io: file, filename: "photo#{rand(1000)}.jpg", content_type: 'image/jpg')

    if photo.save
      puts "Foto #{photo.id} creada con éxito."
    else
      puts "Error al crear la foto: #{photo.errors.full_messages.join(', ')}"
    end
  end

  # creo 10 usuarios normales
  10.times do |i|
    user = User.create!(
      name: Faker::Name.name,
      email: Faker::Internet.email,
      password: '123456',
      role: :normal_user
    )

    # foto perfil
    file = URI.open("https://picsum.photos/200/200")
    user.profile_image.attach(io: file, filename: "profile_image_#{i}.jpg", content_type: "image/jpg")

    puts "Usuario #{user.name} creado con foto de perfil."
  end
else
  puts "Administrador no encontrado."
end
