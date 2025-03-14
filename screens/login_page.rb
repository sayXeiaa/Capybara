require 'site_prism'

class LoginPage < SitePrism::Page
  # include Capybara::DSL 

  def visit_page
    visit "/"
  end

  def visit_login_page
    visit "login"
  end

  element :login_button, :id, "login-button"
  element :login_button_clickable, :id, "login-button"
  element :logo, :xpath, "//a/img"
  element :email_field, :id, "email"
  element :password_field, :id, "password"

  def login_button_clickable?
    login_button.click if login_button.visible?
    has_logo?(wait: 5)
  end

  def enter_email(email)
    if email_field.visible?
      email_field.send_keys(email)
    end
  end

  def enter_password(password)
    if password_field.visible?
      password_field.send_keys(password)
    end
  end

  def can_login?(email, password)
    enter_email(email)
    enter_password(password)
    find(:xpath, "//form//div[4]/button").click
    has_selector?('h2.font-semibold')
  end  
end