require_relative "screens/landing_page"
Capybara.default_driver = :selenium

RSpec.describe "Landing Page", type: :feature do
  let(:landing_page) { LandingPage.new }

  before(:all) do
    Capybara.current_session.driver.browser.manage.window.maximize
  end

  before(:each) do
    landing_page.load
  end
  context "Checking Landing Page UI" do
    it "Displays the Home label" do
      expect(landing_page.home_label.text).to eq("Home")
    end
    it "Has a Logo" do
      expect(landing_page).to have_logo
    end
  end
end