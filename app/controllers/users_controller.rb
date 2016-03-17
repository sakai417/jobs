class UsersController < ApplicationController

  def show
    @user = User.find(current_user.id)
    @articles = current_user.articles
  end

end
