require 'site_prism'

class LandingPage < SitePrism::Page
  set_url '/'

  element :home_label, :xpath, "//h2[contains(text(), 'Home')]"
  element :logo, :css, 'img[src="http://localhost:8000/images/shottracklogo.png"]'
end