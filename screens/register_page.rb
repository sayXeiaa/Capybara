require "capybara/dsl"
Capybara.app_host = "http://localhost:8000/"

class RegisterPage
  include Capybara::DSL

  def visit_page
    visit "/"
  end

  def visit_register_page
    visit "register"
  end

  def register_button?
    has_selector?(:id, "register-button")
  end

  def register_button_clickable?
    has_selector?(:id, "register-button", wait: 5)
  end  

  def name_field?
    has_selector?(:id, "name", wait: 3)
  end

  def password_field?
    has_selector?(:id, "password", wait: 3)
  end

  def email_field?
    has_selector?(:id, "email", wait: 3)
  end

  def password_field?
    has_selector?(:id, "password", wait: 3)
  end

  def confirm_password_field?
    has_selector?(:id, "password_confirmation", wait: 3)
  end

  def enter_name(name)
    find(:id, "name").send_keys(name)
  end

  def enter_email(email)
    find(:id, "email").send_keys(email)
  end

  def enter_password(password)
    find(:id, "password").send_keys(password)
  end

  def enter_password_confirmation(password_confirmation)
    find(:id, "password_confirmation").send_keys(password_confirmation)
  end

  def can_register?(name, email, password, password_confirmation)
    enter_name(name)
    enter_email(email)
    enter_password(password)
    enter_password_confirmation(password_confirmation)
    find(:xpath, "//div[5]//button").click
    has_selector?('h2.font-semibold')
  end  
end