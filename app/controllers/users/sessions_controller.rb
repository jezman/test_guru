class Users::SessionsController < Devise::SessionsController
  after_action :greeting, only: :create

  protected

  def greeting
    flash[:notice] = "Hello, #{current_user.first_name}"
  end
end
