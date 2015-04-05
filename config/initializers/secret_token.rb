# Be sure to restart your server when you modify this file.

# Your secret key for verifying the integrity of signed cookies.
# If you change this key, all old signed cookies will become invalid!
# Make sure the secret is at least 30 characters and all random,
# no regular words or you'll be exposed to dictionary attacks.
#Bloccit::Application.config.secret_token = 'ac5e6e82a54b9d4a29e7a847a3a88bc465b8fb7fc93f99462d6a0703ebea937405749f716ae99ed04b6c6a2e36975b1cb5759880b7a5cecfa4256b136bfeafd1'
Bloccit::Application.config.secret_token = ENV['SECRET_KEY_BASE']