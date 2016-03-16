class UsersController < ApplicationController

  def show
    @user = User.find(current_user.id)
    @article = current_user.articles
  end

end
