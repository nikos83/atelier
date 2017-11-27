class UsersController < ApplicationController
  def index
    # all users
  end

  def show
    # profil usera
  end
  def calculate
    (Time.now.year - current_user.birghtday.year)
  end
end
