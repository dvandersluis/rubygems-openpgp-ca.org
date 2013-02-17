require 'open3'

module ApplicationHelper
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
  
private

  def run_command command, message=nil
    sin, sout, serr = Open3.popen3(command)
    sin.write(message) if message
    sin.close

    output = sout.read
    err = serr.read

    if $? != 0
      raise RuntimeError, err
    end

    output
  end
  
  def openpgp_encrypt openpgp_key, message

    gpg_getkey_command = "gpg"
    gpg_getkey_command << " --keyserver pool.sks-keyservers.net"
    gpg_getkey_command << " --keyserver-options auto-key-retrieve"
    gpg_getkey_command << " --recv-keys #{openpgp_key}"
    run_command(gpg_getkey_command)

    gpg_encrypt_command = "gpg --armor --encrypt -r #{openpgp_key}"
    gpg_encrypt_command << " --trust-model always"
    encrypted_text = run_command(gpg_encrypt_command, message)

    encrypted_text
  end
  

end
