require 'open3'

module ApplicationHelper
  def openpgp_encrypt openpgp_key, message
    gpg_encrypt_command = "gpg --armor --encrypt -r #{openpgp_key}"
    gpg_encrypt_command << " --trust-model always"
    gpg_encrypt_command << " --keyserver pool.sks-keyservers.net"
    gpg_encrypt_command << " --keyserver-options auto-key-retrieve"

    sin, sout, serr = Open3.popen3(gpg_encrypt_command)
    sin.write(message)
    sin.close

    output = sout.read
    err = serr.read

    if !err.blank?
      raise Key::GPGError, err
    end

    output
  end
  
  def encrypted_confirmation key, confirmation_link

    message = <<WELCOME
Decryption was successful.

Please authenticate ownership of the private key by clicking the
confirmation link below:

#{confirmation_link}

Thanks!
WELCOME

    openpgp_encrypt @resource.openpgp_key, message
  end
  

end
