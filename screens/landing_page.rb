require 'site_prism'

class LandingPage < SitePrism::Page
  def visit_landing_page
    visit "/"
  end

  element :home_label, :xpath, "//h2[contains(text(), 'Home')]"
  element :logo, :css, 'img[src="http://localhost:8000/images/shottracklogo.png"]'
  element :tracking_section, :xpath, '//div//div[1]'
  element :analytics_section, :xpath, '//div//div[2]'
  element :user_friendly_section, :xpath, '//div//div[3]'
  element :tournament_button, :css, 'body main > div.py-6.sm\:py-12 div.bg-white a'
  element :tournament_page_label, :xpath, '//div/h2'

  def tournament_button_clickable?
    tournament_button.click if tournament_button.visible?
    has_tournament_page_label?(wait: 2)
  end 

end