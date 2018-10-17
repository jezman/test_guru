class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  protected

  def after_sign_in_path_for(user)
    user.is_a?(Admin) ? admin_tests_path : super
  end
end
