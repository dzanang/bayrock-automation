require './lib/base_page'

class MyReferralsPage < BasePage

  ##########################################################
  ##                  LOCATOR METHODS                     ##
  ##########################################################

  def referral_title
    @browser.element(xpath: "//div[@class='title']/h1")
  end

  def referral_cards
    @browser.elements(class: 'media_body')
  end

  ##########################################################
  ##                    CHECK METHODS                     ##
  ##########################################################

  def check_title
    wait_present(referral_title)
    if referral_title.text.include? 'My referrals'
      return true
    end
  end

  def check_referral_present(user)
    sleep 2
    referral_cards.each do |card|
      if card.h3.text == user
        puts card.h3.text
        return true
        break
      end
    end
  end
end
