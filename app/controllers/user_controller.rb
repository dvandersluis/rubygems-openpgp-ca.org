class UserController < ApplicationController
  before_filter :authenticate_user!

  def status
    @user = current_user
  end
end
