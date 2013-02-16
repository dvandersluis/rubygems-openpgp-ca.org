class Key < ActiveRecord::Base
  devise :confirmable

  belongs_to :user

  attr_accessible :user_id

  def email
    user.email
  end

  # don't really have email.
  def email_changed?
    false
  end
  
end
