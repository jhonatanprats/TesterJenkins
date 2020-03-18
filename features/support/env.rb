require 'capybara'
require 'capybara/cucumber'
require 'selenium-webdriver'
require "os"

require_relative "helpers"

World(Helpers) #Assim fala que todos recursos do módulo helpers de Helpers são nativos dentro da execução cucumber, assim ele fica disponivél em qualquer parte do código

CONFIG = YAML.load_file(File.join(Dir.pwd, "features/support/config/#{ENV["ENV_TYPE"]}.yaml"))

case ENV["BROWSER"]
when "firefox"
    @driver = :selenium_chrome
when "chrome"
    @driver = :selenium_chrome
when "headless"
    @driver = :selenium_chrome_headless
else
    puts "Invalid Browser"
end

Capybara.configure do |config|

    config.default_driver = @driver
    config.app_host = CONFIG["url"]
    config.default_max_wait_time = 15

end