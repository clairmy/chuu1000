class RegistrationsController < ApplicationController
  
  respond_to :json
  def create
    user = User.new(user_params)
    if user.save
      render :json=>user.as_json(:auth_token=>user.authentication_token), :status=>200
      return
    else
      render :json=>user.errors, :status=>422
    end
  end
  
  def user_params
      params.require(:user).permit(:email, :password);
  end
end
