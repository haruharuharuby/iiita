class Users::RegistrationsController < Devise::RegistrationsController
  before_action :sign_up_params, only:[:sign_up]

  def create
    super
  end

  private
    def sign_up_params
      params.require(:user).permit(:name, :email, :password)
    end
end
