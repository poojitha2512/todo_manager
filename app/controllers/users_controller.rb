# users_controller.rb
class UsersController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    render plain: User.all.map { |user| user.to_pleasant_string }.join("\n")
  end

  def show
    id = params[:id]
    user = User.find(id)
    render plain: user.to_pleasant_string
  end

  def create
    name = params[:name]
    email = params[:email]
    password = params[:password]
    new_user = User.create!(
      name: name,
      email: email,
      password: password,

    )
    response_text = "hey new user created with id #{new_user.id}"
    render plain: response_text
  end

  def login
    render plain: User.where("email = ? and password = ? ",
                             params[:email], params[:password]).exists?
  end
end
