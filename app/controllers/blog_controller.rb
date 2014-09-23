class BlogController < ApplicationController
def index
     @mensajes = Mensaje.all
end
def nuevo_mensaje
   	   @mensaje = Mensaje.new
end

def guardar_mensaje
	#inicializamos el objeto y recibimos y asignamos datos
	@mensaje = Mensaje.new(mensaje_params)
 
	#guardamos mensaje en BD
    #condiciones para evaluar si se cumplen las valdaciones
    if @mensaje.save
         flash[:aviso] = "Mensaje guardado con exito"

         #todas las validaciones se cumplieron y se guarda en la BD
        redirect_to :action => 'index'
    else
        flash[:aviso] = "error favor de verificar los datos"

          #no se cumplieron todas las validaciones y se regresa el usuario al formulario
        render :action => 'nuevo_mensaje'

    end
end

private
    def mensaje_params
	params.require(:mensaje).permit(:titulo, :descripcion)
    end

end
