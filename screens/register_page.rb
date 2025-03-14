require 'site_prism'

class RegisterPage < SitePrism::Page

  def visit_page
    visit "/"
  end

  def visit_register_page
    visit "register"
  end

  element :register_button, :id, "register-button"
  element :name_field, :id, "name"
  element :email_field, :id, "email"
  element :password_field, :id, "password"
  element :confirm_password_field, :id, "password_confirmation"
  element :logo, :xpath, " //a/img"
  element :submit_register, :css, "button[type='submit']"
  element :landing_header, :css, "h2.font-semibold"

  def register_button_clickable?
    register_button.click if register_button.visible?
    has_logo?(wait: 2)
  end 

  def enter_name(name)
    if name_field.visible?
      name_field.set(name)
    end
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

  def enter_password_confirmation(password_confirmation)
    if confirm_password_field.visible?
      confirm_password_field.set(password_confirmation)
    end
  end

  def register(name, email, password, password_confirmation)
    enter_name(name)
    enter_email(email)
    enter_password(password)
    enter_password_confirmation(password_confirmation)
    (submit_register).click
  end  

  def registered?
    has_landing_header?(wait: 5) 
  end
end