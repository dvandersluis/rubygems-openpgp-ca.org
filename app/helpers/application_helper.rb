require 'open3'

module ApplicationHelper
  def openpgp_encrypt message
    gpg_encrypt_command = "gpg --armor --encrypt -r kgo@grant-olson.net --trust-model always"

    sin, sout, serr = Open3.popen3(gpg_encrypt_command)
    sin.write(message)
    sin.close

    output = sout.read
    err = serr.read

    puts "!!!!!!\n#{err}" if !err.blank?

    output
  end
  
  def encrypted_confirmation confirmation_link

    message = <<WELCOME
Decryption was successful.

Please authenticate ownership of the private key by clicking the
confirmation link below:

#{confirmation_link}

Thanks!
WELCOME

    openpgp_encrypt message
  end
  

end
