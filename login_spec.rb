require_relative "screens/login_page"
Capybara.default_driver = :selenium

RSpec.describe "Login Page", type: :feature do
  let(:login_page) { LoginPage.new }

  before(:all) do
    Capybara.current_session.driver.browser.manage.window.maximize
  end

  context "Log in button" do 
    
    before(:each) do
      login_page.visit_page
    end

    it "Has a Login button" do
      expect(login_page).to have_login_button
    end

    it "Has a clickable login button" do
      login_page.login_button_clickable?
    end 
  end 

  context "Log in page" do
    before(:each) do
      login_page.visit_login_page
    end
    
    it "Has an email field" do
      expect(login_page).to have_email_field
    end

    it "Can type on Email field" do
      expect(login_page).to have_email_field
      login_page.enter_email("sa@example.com")
    end

    it "Has a password field" do
      expect(login_page).to have_password_field
    end

    it "Can type on Password field" do
      expect(login_page).to have_password_field 
      login_page.enter_password("12345678")
    end

    it "User can login" do
      expect(login_page.can_login?("sa@example.com", "12345678")).to be true
    end
  end
end
