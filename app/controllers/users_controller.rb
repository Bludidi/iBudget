class UsersController < ApplicationController
  before_action :authenticate_user!, except: [:home]

  def home
    @user = current_user
    redirect_to categories_path if user_signed_in?
  end
end
