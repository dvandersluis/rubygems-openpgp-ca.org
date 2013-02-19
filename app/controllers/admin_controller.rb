class AdminController < ApplicationController
  before_filter :authenticate_user!
  before_filter :admin_user

  def pending_applications
    @pending_users = User.find_all_by_status(User::STATUS_PENDING)
  end

  def edit_status
    @user = User.find(params[:user])
  end
  

private

  def admin_user
    if current_user.nil? || !current_user.admin?
      render :status => :forbidden, :text => "Yeah, right!"
    end
  end
  
end
