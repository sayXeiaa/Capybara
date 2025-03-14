require 'site_prism'

class LoginPage < SitePrism::Page

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
  element :submit_login, :css, "button[type='submit']"
  element :landing_header, :css, "h2.font-semibold"

  def login_button_clickable?
    login_button.click if login_button.visible?
    has_logo?(wait: 5)
  end

  def enter_email(email)
    if email_field.visible?
      email_field.set(email)
    end
  end

  def enter_password(password)
    if password_field.visible?
      password_field.set(password)
    end
  end

  def login(email, password)
    email_field.set(email)
    password_field.set(password)
    (submit_login).click
  end

  def logged_in?
    has_landing_header?(wait: 5) 
  end
end