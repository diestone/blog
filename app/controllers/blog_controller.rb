class BlogController < ApplicationController

def login
       if request.post?
         @usuario = Usuario.find_by_email(params[:usuario][:email][:imagen])
         if @usuario && @usuario.authenticate(params[:usuario][:password])
          #usuario valido
          session[:usuario] = @usuario.id
          redirect_to :action => 'nuevo_mensaje'
         else
         flash[:notice] = "Email y/o password incorrecto"
         render :action => 'login'
            #usuario invalido
         end



       else
         @usuario = Usuario.new
     end
 end



def index
     @mensajes = Mensaje.paginate(:page => params[:page], :per_page => 30)
     @cantidadMensajes = Mensaje.count
    
end
def nuevo_mensaje
   	   @mensaje = Mensaje.new
end

def guardar_mensaje
	#inicializamos el objeto y recibimos y asignamos datos
	@mensaje = Mensaje.new(mensaje_params)
 
    usuario = Usuario.find(session[:usuario])

	#guardamos mensaje en BD
    #condiciones para evaluar si se cumplen las valdaciones
    if usuario.mensajes << @mensaje
         flash[:notice] = "Mensaje guardado con exito"

         #todas las validaciones se cumplieron y se guarda en la BD
        redirect_to :action => 'index'
    else
        flash[:notice] = "Error favor de verificar los datos"

          #no se cumplieron todas las validaciones y se regresa el usuario al formulario
        render :action => 'nuevo_mensaje'

    end
end

def registro
       @usuario = Usuario.new
end

def crear_usuario
    @usuario = Usuario.new(usuario_params)
     
    if @usuario.save
         flash[:notice] = "Bienvenido: #{@usuario.nombre}"
        session[:usuario] = @usuario.id


         #todas las validaciones se cumplieron y se guarda en la BD
        redirect_to :action => 'nuevo_mensaje'
    else
        flash[:notice] = "Error favor de verificar los datos"

          #no se cumplieron todas las validaciones y se regresa el usuario al formulario
        render :action => 'registro'

    end
       
end

private
    def mensaje_params
	params.require(:mensaje).permit(:titulo, :descripcion, :imagen)
    end
def usuario_params
    params.require(:usuario).permit(:nombre, :email, :imagen)
    end
end
