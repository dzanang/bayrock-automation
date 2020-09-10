require './lib/base_page'

class NavigationPage < BasePage

  ##########################################################
  ##                  LOCATOR METHODS                     ##
  ##########################################################

  def navigation
    @browser.elements(class: ['navigation--link'])
  end

  ##########################################################
  ##                    CLICK METHODS                     ##
  ##########################################################

  def click_menu_item(item)
    sleep 5
    navigation.each do | nav |
      if nav.inner_text.include? item
        nav.click!
    end
  end
end
end
