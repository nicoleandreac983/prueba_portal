class ApplicationController < ActionController::Base
    def authorize_request(kind = nil)
        unless kind.include?(current_user.role)
            redirect_to posts_path, notice: "Tu no estas autorizado para esta acción"
        end
    end
    def authenticate_admin!
        redirect_to root_path, alert: 'Acceso denegado.' unless current_user.admin?
    end

    def after_sign_in_path_for(resource)
        # Redirigir al usuario a la lista de ofertas laborales después de iniciar sesión
        job_offers_path
    end

    def configure_permitted_parameters
        devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :phone, :cargo, :images])
        devise_parameter_sanitizer.permit(:account_update, keys: [:name, :phone, :cargo, :images])
    end
        def index
            @application = Application.all
        end
        
        def show
            @application = Application.find(params[:id])
        end
        
        def new
            @application = Application.new
        end
        
        def create
            @application = Application.new(application_params)
            if @application.save
            redirect_to @application, notice: 'La aplicación ha sido creada exitosamente.'
            else
            render :new
            end
        end
        
        def edit
            @application = Application.find(params[:id])
        end
        
        def update
            @application = Application.find(params[:id])
            if @application.update(application_params)
            redirect_to @application, notice: 'La aplicación ha sido actualizada exitosamente.'
            else
            render :edit
            end
        end
        
        def destroy
            @application = Application.find(params[:id])
            @application.destroy
            redirect_to applications_path, notice: 'La aplicación ha sido eliminada exitosamente.'
        end
        
        private
        
        def application_params
            params.require(:application).permit(:name, :email, :cover_letter, :resume)
        end
end