class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
  end

  def my_watches
    @user = current_user
    @my_watches = @user.watches
  end
end
