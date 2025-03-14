require 'site_prism'

class LoginPage < SitePrism::Page
  # include Capybara::DSL 

  def visit_page
    visit "/"
  end

  def visit_login_page
    visit "/login"
  end

  element :login_button, :id, "login-button"
  # def login_button?
  #   has_selector?(:id, "login-button")
  # end

  def login_button_clickable?
    has_selector?(:id, "login-button", wait: 5)
  end  

  def email_field?
    has_selector?(:id, "email", wait: 3)
  end

  def enter_email(email)
    find(:id, "email").send_keys(email)
  end

  def password_field?
    has_selector?(:id, "password", wait: 3)
  end

  def enter_password(password)
    find(:id, "password").send_keys(password)
  end

  def can_login?(email, password)
    enter_email(email)
    enter_password(password)
    find(:xpath, "//form//div[4]/button").click
    has_selector?('h2.font-semibold')
  end  
end