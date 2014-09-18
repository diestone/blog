class BlogController < ApplicationController
     def index
   #crear un registro
registro = Mensaje.new
registro.titulo = "Titular"
registro.descripcion = "descripcion"
registro.save


     	#inicio listos para codear
     	@mensaje = Mensaje.first


        @cantidad = Mensaje.count
end
end
