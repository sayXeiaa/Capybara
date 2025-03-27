require_relative "screens/login_page"
Capybara.default_driver = :selenium

RSpec.describe "Login Page", type: :feature do
  let(:login_page) { LoginPage.new }

  before(:all) do
    Capybara.current_session.driver.browser.manage.window.maximize
  end

  shared_examples "valid login" do |email, password|
    it "Logs in successfully with email: #{email}" do
      login_page.login(email, password)

      expect(login_page).to have_landing_header(wait: 5)
    end
  end

  shared_examples "invalid login" do |email, password, error_message|
    it "Fails to log in with email: #{email}, password: #{password}" do
      login_page.login(email, password)

      expect(login_page).not_to have_landing_header
    end
  end

  context "Log in button" do 
    before(:each) do
      login_page.visit_page
    end

    it "Has a Login button" do
      expect(login_page).to have_login_button
    end

    it "Has a clickable login button" do
      expect(login_page.login_button_clickable?).to be true
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
  end

  context "Login Scenarios" do
    context "Valid Login" do
      before(:each) do
        login_page.visit_login_page
      end

      include_examples "valid login", "sa@example.com", "12345678"
      include_examples "valid login", "to@example.com", "Organizer123"
    end

    context "Invalid Login" do
      before(:each) do
        login_page.visit_login_page
      end

      include_examples "invalid login", "", ""
      include_examples "invalid login", "invalid@example.com", "asjdh@as"
      include_examples "invalid login", "user@example.com", ""
      include_examples "invalid login", "", "password123"
      include_examples "invalid login", "user", "1"
    end
  end  
end