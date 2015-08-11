class Api::UsersController < ApplicationController
 skip_before_filter :verify_authenticity_token
  def index
  render json: User.all  
  end
  
  def create
    params[:user] = {:email => params[:email], :password => params[:password], :password_confirmation => params[:password_confirmation]}
    user = User.new(user_params)
    if user.save
      render status: 200, json: {
        message: "Sucessfully Registered User",
        user: user,
      }.to_json
    else
      render status: 422, json: {
       errors: user.errors
      }.to_json
    end
  end
  
  private
  # Never trust parameters from the scary internet, only allow the white list through.
  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation, :password_hash, :password_salt)
  end
    
end