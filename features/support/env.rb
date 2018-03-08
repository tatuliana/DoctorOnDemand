require "selenium-webdriver"
require "rspec"

$base_url = (ENV['BASE'] || "doctorondemand.com").to_s
LOGIN = (ENV['LOGIN']).to_s
PASSWORD = (ENV['PASSWORD']).to_s
ENVIRONMENT = (ENV['ENVIRONMENT'] || :production).to_sym
ENV_LOGIN = (ENV['ENV_LOGIN']).to_s
ENV_PASSWORD = (ENV['ENV_PASSWORD']).to_s



