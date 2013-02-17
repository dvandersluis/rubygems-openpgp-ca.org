class Key < ActiveRecord::Base

  devise :confirmable

  belongs_to :user

  attr_accessible :user_id, :openpgp_key

  validates :openpgp_key, :presence => true, :format => { :with => /^0x[0-9A-Z]{8}$/, :message => "Must use short key id format: 0xDEADBEEF"}

  def email
    user.email
  end

  # don't really have email.
  def email_changed?
    false
  end
  
end
