
class Users::RegistrationsController < Devise::RegistrationsController
  before_action :authenticate_admin!, only: [:new, :create]
  skip_before_action :require_no_authentication, only: [:new, :create]

  def new
    build_resource({})
  end

  def create
    build_resource(sign_up_params)

    if resource.save
      yield resource if block_given?
      if resource.persisted?
        if resource.active_for_authentication?
          set_flash_message! :notice, :signed_up
          sign_up(resource_name, resource)
          respond_with resource, location: after_sign_up_path_for(resource)
        else
          set_flash_message! :notice, :"signed_up_but_#{resource.inactive_message}"
          expire_data_after_sign_in!
          respond_with resource, location: after_inactive_sign_up_path_for(resource)
        end
      else
        set_flash_message! :alert, :something_went_wrong
        redirect_to new_user_registration_path
      end
    else
      clean_up_passwords resource
      set_minimum_password_length
      respond_with resource
    end
  end

  private

  def sign_up_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :phone, :cargo, images_attributes: [:url, :context])
  end
end