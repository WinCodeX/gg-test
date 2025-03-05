class Message < ApplicationRecord
    require 'openssl'
require 'base64'
  belongs_to :conversation
  before_save :encrypt_content

  def encrypt_content
    cipher = OpenSSL::Cipher.new('AES-256-CBC').encrypt
    cipher.key = Rails.application.secret_key_base[0..31]
    iv = cipher.random_iv
    cipher.iv = iv
    encrypted = cipher.update(content) + cipher.final
    self.content = Base64.encode64(iv + encrypted)
    self.encrypted = true
  end
end
