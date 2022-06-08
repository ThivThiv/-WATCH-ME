class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
  end

  def my_watches
    @user = current_user
    @watches = @user.watches
    @my_watches = Watch.all
  end
end
