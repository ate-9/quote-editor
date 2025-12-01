require "test_helper"

class ApplicationSystemTestCase < ActionDispatch::SystemTestCase
  include Warden::Test::Helpers
  include ActionView::RecordIdentifier

  driven_by :selenium, using: :headless_chrome, screen_size: [ 1400, 1400 ]
end
