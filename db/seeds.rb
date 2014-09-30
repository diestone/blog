10000.times do
mensaje = Mensaje.new
mensaje.titulo = Faker::Lorem.sentence
mensaje.descripcion = Faker::Lorem.paragraph
mensaje.save
end
puts 'registro agregado'