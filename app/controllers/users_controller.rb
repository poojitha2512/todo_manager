# users_controller.rb
class UsersController < ApplicationController
  def new
    render "users/new"
  end

  def create
    User.create!(
      first_name: params[:first_name],
      last_name: params[:last_name],
      email: params[:email],
    )
    redirect_to "/"
  end
end
