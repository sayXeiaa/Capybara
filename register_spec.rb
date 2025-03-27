require_relative "screens/register_page"
Capybara.default_driver = :selenium

RSpec.describe "Register Page", type: :feature do
  let(:register_page) { RegisterPage.new }

  before(:all) do
    Capybara.current_session.driver.browser.manage.window.maximize
  end

  shared_examples "valid registration" do |name, email, password, password_confirmation|
    it "Registers with name: #{name}, email: #{email}, password: #{password}" do
      register_page.register(name, email, password, password_confirmation)
      expect(register_page).to have_landing_header
    end
  end

  shared_examples "invalid registration" do |name, email, password, password_confirmation|
    it "Fails to register with name: #{name}, email: #{email}, password: #{password}" do
      register_page.register(name, email, password, password_confirmation)
      expect(register_page).not_to have_landing_header
    end
  end

  context "Register button" do
    before(:each) do
      register_page.visit_page
    end

    it "Has a register button" do
      expect(register_page).to have_register_button
    end

    it "Has a clickable register button" do
      expect(register_page.register_button_clickable?).to be_truthy
    end
  end

  context "Register Page" do
    before(:each) do
      register_page.visit_register_page
    end

    it "Has a name field" do
      expect(register_page).to have_name_field
    end

    it "Has an email field" do
      expect(register_page).to have_email_field
    end

    it "Has a password field" do 
      expect(register_page).to have_password_field
    end

    it "Has a confirm password field" do
      expect(register_page).to have_confirm_password_field
    end
  end

  context "Register Scenario" do
    context "Valid Credentials" do
      before(:each) do
        register_page.visit_register_page
      end
      include_examples "valid registration", "John Doe", "johndoe@example.com", "Password_123", "Password_123"
      include_examples "valid registration", "Jane Smith", "janesmith@example.com", "SecurePass1", "SecurePass1"
    end

    context "Invalid Credentials" do
      before(:each) do
        register_page.visit_register_page
      end
      include_examples "invalid registration", "", "", "", ""
      include_examples "invalid registration", "", "invalidemail", "pass4", "diffpass"
      include_examples "invalid registration", "Name", "", "ValidPass123", "ValidPass123"
      include_examples "invalid registration", "Qasem Soleimani", "user@example.com", "P@ssw0rd", ""
    end
  end
end