require "capybara"
require "capybara/cucumber"
require "selenium-webdriver"

browser = ENV["BROWSER"]

case browser
when "firefox"
    @driver = :selenium
when "chrome"
    @driver = :chrome_custom
when "headless"
    @driver = :selenium_chrome_headless
else
    @driver = :chrome_custom
end


Capybara.register_driver :chrome_custom do |app|
    caps = Selenium::WebDriver::Remote::Capabilities.chrome(
      "chromeOptions" => {
        "args" => ["--headless", "--disable-site-isolation-trials", "--disable-gpu"],
        "excludeSwitches" => ["enable-logging"],
      },
    )
    Capybara::Selenium::Driver.new(app, :browser => :chrome, :desired_capabilities => caps)
end

Capybara.configure do |config|
    config.default_driver = @driver
    config.default_max_wait_time = 5
end