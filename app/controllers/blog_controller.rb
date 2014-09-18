class BlogController < ApplicationController
     def index
     @mensajes = Mensaje.all
end
   def nuevo_mensaje
   	   @mensaje = Mensaje.new
   end
end
