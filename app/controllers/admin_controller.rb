class AdminController < ApplicationController
  before_filter :authenticate_user!
  before_filter :admin_user

  def pending_applications
    @pending_users = User.find_all_by_status(User::STATUS_PENDING)
  end

  def edit_status
    @user = User.find(params[:user])
  end
  
  def update_status
    @user = User.find(params[:user])
    @user.status = params[:post][:status].to_i
    @user.status_note = params[:post][:status_note]
    @user.save!

    redirect_to admin_pending_applications_path
  end
  

private

  def admin_user
    if current_user.nil? || !current_user.admin?
      render :status => :forbidden, :text => "Yeah, right!"
    end
  end
  
end
