class HomeController < ApplicationController
  def index
  end

  def key_security
    redirect_to "/blog/signing-key-security.html"
  end

  def authentication
    redirect_to "/blog/authentication.html"
  end
    

  def contact
    redirect_to "/blog/contact.html"
  end

  def pending_applications
    render :text => (User.pending.length.to_s + "\n")
  end
  
end
