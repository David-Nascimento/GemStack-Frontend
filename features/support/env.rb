require "capybara"
require "capybara/cucumber"
require "selenium-webdriver"

browser = ENV["BROWSER"]

case browser
when "firefox"
    @driver = :selenium
when "chrome"
    @driver = :selenium_chrome
when "headless"
    @driver = :selenium_chrome_headless
else
    @driver = :selenium_chrome
end

Capybara.configure do |config|
    config.default_driver = @driver
    config.default_max_wait_time = 5
end