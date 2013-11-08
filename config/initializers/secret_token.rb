# Be sure to restart your server when you modify this file.

# Your secret key is used for verifying the integrity of signed cookies.
# If you change this key, all old signed cookies will become invalid!

# Make sure the secret is at least 30 characters and all random,
# no regular words or you'll be exposed to dictionary attacks.
# You can use `rake secret` to generate a secure secret key.

# Make sure your secret_key_base is kept private
# if you're sharing your code publicly.
#SampleApp::Application.config.secret_key_base = '4520137e6a2d4ad87b9274bbec9b2710fc13adab4c680797215cb3d3b99eb5721ee126b6f911bec3f31dd83903eb65f345553759f15f01557f446f0e1ed0791b'

require 'securerandom'

def secure_token
  token_file = Rails.root.join('.secret')
  if File.exist?(token_file)
  	# Use the existing token.
  	File.read(token_file).chomp
  else
  	# Generate a new token and store it in token_file.
  	token = SecureRandom.hex(64)
  	File.write(token_file, token)
  	token
  end
end

SampleApp::Application.config.secret_key_base = secure_token