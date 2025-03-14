require_relative "screens/register_page"
Capybara.default_driver = :selenium

RSpec.describe "Register Page", type: :feature do
  let(:register_page) { RegisterPage.new }

  before(:all) do
    Capybara.current_session.driver.browser.manage.window.maximize
  end

  context "Register button" do

    before(:each) do
      register_page.visit_page
    end

    it "Has a register button" do
      expect(register_page).to have_register_button
    end

    it "Has a clickable register button" do
      register_page.register_button_clickable?
    end
  end

  context "Register Page" do

    before(:each) do
      register_page.visit_register_page
    end

    it "Has a name field" do
      expect(register_page).to have_name_field
    end

    it "Can type on name field" do
      expect(register_page).to have_name_field
      register_page.enter_name("Saddam Hussein")
    end

    it "Has an email field" do
      expect(register_page).to have_email_field
    end

    it "Can type on email field" do
      expect(register_page).to have_email_field
      register_page.enter_email("shussein@gmail.com")
    end

    it "Has a password field" do 
      expect(register_page).to have_password_field
    end

    it "Can type on password field" do
      expect(register_page).to have_password_field
      register_page.enter_password("Test_123")
    end

    it "Has a confirm password field" do
      expect(register_page).to have_confirm_password_field
    end

    it "Can type on confirm password field" do
      expect(register_page).to have_confirm_password_field
      register_page.enter_password_confirmation("Test_123")
    end

    it "User can register" do
      register_page.register("Saddam Hussein", "shussein@gmail.com", "Test_123", "Test_123")
      expect(register_page).to have_landing_header
    end
  end
end