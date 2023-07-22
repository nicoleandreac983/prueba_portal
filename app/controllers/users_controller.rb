class UsersController < ApplicationController
    def new
        @user = User.new
        @user.images.build
    end
    private

    def user_params
        params.require(:user).permit(:email, :name, :phone, :cargo, :password, :password_confirmation, images_attributes: [:url, :context])
    end
end
