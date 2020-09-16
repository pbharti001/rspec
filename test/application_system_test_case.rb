require "test_helper"
# require "capybara/poltergeist"

class ApplicationSystemTestCase < ActionDispatch::SystemTestCase
  driven_by :selenium, using: :firefox, screen_size: [1400, 1400] #If u r using headless_firefox or headless_chrome the screenshot is not going to pop-up.
  # driven_by :poltergeist
end
