class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :openpgp_key, :presence => true, :format => { :with => /^0x[0-9A-Z]{8}$/, :message => "Must use short key id format: 0xDEADBEEF"}
  validates :rubygems_profile_page, :presence => true, :format => { :with => /^https:\/\/rubygems.org\/profiles\/.+$/, :message => "Must be https://rubygems.org/profiles/USERNAME"}
  validate :validate_published_openpgp_key

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :openpgp_key, :rubygems_profile_page
  # attr_accessible :title, :body

  STATUS_CODES = { 0 => "PENDING", 1 => "ACCEPTED", -1 => "REJECTED"}
  STATUS_PENDING = 0
  STATUS_ACCEPTED = 1
  STATUS_REJECTED = -1

  def status_code
    STATUS_CODES[status] || "???"
  end
  
  def openpgp_get_key
    gpg_getkey_command = "gpg"
    gpg_getkey_command << " --keyserver pool.sks-keyservers.net"
    gpg_getkey_command << " --keyserver-options auto-key-retrieve"
    gpg_getkey_command << " --recv-keys #{self.openpgp_key}"
    run_command(gpg_getkey_command)
  end
  
  def openpgp_encrypt message
    gpg_encrypt_command = "gpg --armor --encrypt -r #{self.openpgp_key}"
    gpg_encrypt_command << " --trust-model always"
    encrypted_text = run_command(gpg_encrypt_command, message)

    encrypted_text
  end

  def validate_published_openpgp_key
    openpgp_get_key
  rescue GPGError => ex
    error = if ex.message.include?("no valid OpenPGP data found")
              "Couldn't find key #{self.openpgp_key} on the keyservers. " +
                " Did you publish it? " +
                "(gpg --keyserver pool.sks-keyservers.net --send-key #{self.openpgp_key})"
            else
              ex.message
            end
    
    errors.add(:gpg, error)
  end

  class GPGError < StandardError
  end

private

  def run_command command, message=nil
    sin, sout, serr, wait_thr  = Open3.popen3(command)
    sin.write(message) if message
    sin.close

    output = sout.read
    err = serr.read

    if wait_thr.value != 0
      raise GPGError, "#{err}"
    end

    output
  end
end
