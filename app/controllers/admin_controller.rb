class AdminController < ApplicationController
  before_filter :authenticate_user!
  before_filter :admin_user

  def pending_applications
  end

private

  def admin_user
    if current_user.nil? || !current_user.admin?
      render :status => :forbidden, :text => "Yeah, right!"
    end
  end
  
end
