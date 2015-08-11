class Api::SessionsController < ApplicationController
 skip_before_filter :verify_authenticity_token
 
  def create
    user = User.authenticate(params[:email], params[:password])
    if user
     render status: 200, json: {
       message: 'Login Successul',
       user: user,
     }.to_json
    else
     render status: 422, json: {
       message: 'Login Unsuccesful',
     }.to_json
    end
  end
end