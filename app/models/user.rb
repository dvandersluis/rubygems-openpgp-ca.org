class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :openpgp_key, :presence => true, :format => { :with => /^0x[0-9A-Z]{8}$/, :message => "Must use short key id format: 0xDEADBEEF"}
  validates :rubygems_profile_page, :presence => true, :format => { :with => /^https:\/\/rubygems.org\/profiles\/.+$/, :message => "Must be https://rubygems.org/profiles/USERNAME"}

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :openpgp_key, :rubygems_profile_page
  # attr_accessible :title, :body

  STATUS_CODES = { 0 => "PENDING", 1 => "ACCEPTED", -1 => "REJECTED"}

  def status_code
    STATUS_CODES[status] || "???"
  end
  
end
