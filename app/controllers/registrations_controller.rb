class RegistrationsController < Devise::RegistrationsController
	def search
		@users = User.search(params[:search])
	end

	def show
		@user = User.find(params[:id])
	end

  private

  def sign_up_params
    params.require(:user).permit(:user_name, :first_name, :last_name, :email, :password, :password_confirmation)
  end

  def account_update_params
    params.require(:user).permit(:user_name, :first_name, :last_name, :email, :password, :password_confirmation, :current_password)
  end
end