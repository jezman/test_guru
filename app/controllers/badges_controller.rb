class BadgesController < ApplicationController
  before_action :authenticate_user!

  def index
    @available_badges = Badge.all
    @user_badges = current_user.badges
  end
end
