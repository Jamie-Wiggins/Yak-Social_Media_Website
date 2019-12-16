class RegistrationsController < Devise::RegistrationsController
    private
    # params to be passed when a user signs up
    def sign_up_params
        params.require(:user).permit(:username, :first_name, :last_name, :email, :password, :password_confirmation)
    end

    # params to be passed when a user updates their account
    def account_update_params
        params.require(:user).permit(:username, :first_name, :last_name, :email, :password, :password_confirmation, :current_password)
    end
end