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

    @resource.openpgp_encrypt message
  end
  
end
