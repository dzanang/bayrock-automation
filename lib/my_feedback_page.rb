require './lib/base_page'

class MyFeedbackPage < BasePage

  ##########################################################
  ##                  LOCATOR METHODS                     ##
  ##########################################################

  def request_title
    @browser.element(xpath: "//div[@class='title']/h1")
  end

  def feedback_cards
    @browser.elements(class: 'card-header')
  end

  ##########################################################
  ##                    CHECK METHODS                     ##
  ##########################################################

  def check_title
    wait_present(request_title)
    if request_title.text.include? 'My feedback'
      return true
    end
  end

  def check_feedback_present(title)
    feedback_cards.each do |card|
      if card.h3.text.include? title
        puts card.h3.text
        return true
        break
      end
    end
  end
end
