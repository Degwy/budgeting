require 'byebug'
require 'capybara'
require 'capybara/dsl'
require 'capybara/cucumber'
require 'capybara/rspec'
require 'selenium/webdriver'
require 'faker'

## Defining main project variables
$root_dir = Dir.pwd
$download_dir = "#{$root_dir}/downloads"
$base_url = 'http://localhost:8000'


## Defining drivers
Capybara.register_driver :chrome do |app|
  # Set up options
  options = Selenium::WebDriver::Chrome::Options.new

  # Preferences
  options.add_preference(:download, { prompt_for_download: false, default_directory: $download_dir } )

  # Start options
  options.add_argument('--disable-print-preview')
  options.add_argument('--ignore-certificate-errors')
  options.add_argument('--disable-popup-blocking')
  options.add_argument('--disable-translate')

  Capybara::Selenium::Driver.new(app, :browser => :chrome, options: options)
end

# Configuring the time needed before retrying to find the elements
Capybara.default_max_wait_time = 2

# Configuring default selector
Capybara.default_selector = :xpath

## Let the fun start...
Capybara.default_driver = :chrome
Capybara.app_host = $base_url



