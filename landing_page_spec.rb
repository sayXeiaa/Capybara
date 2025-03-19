require_relative "screens/landing_page"
Capybara.default_driver = :selenium

RSpec.describe "Landing Page", type: :feature do
  let(:landing_page) { LandingPage.new }

  before(:all) do
    Capybara.current_session.driver.browser.manage.window.maximize
  end

  before(:each) do
    landing_page.visit_landing_page
  end

  context "Checking Landing Page UI" do
    it "Displays the Home label" do
      expect(landing_page.home_label.text).to eq("Home")
    end
    it "Has a Logo" do
      expect(landing_page).to have_logo
    end
    it "Has a real-time tracking section" do
      expect(landing_page).to have_tracking_section
    end
    it "has a graphical analytics section" do
      expect(landing_page).to have_analytics_section
    end
    it "has a user-friendly section" do
      expect(landing_page).to have_user_friendly_section
    end
    it "Displays the tournament button" do
      expect(landing_page).to have_tournament_button
    end
    it "Has a clickable tournament button" do
      landing_page.tournament_button_clickable?
      expect(landing_page).to have_current_path("/tournaments")
    end
  end
end