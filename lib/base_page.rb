class BasePage
  def initialize(browser)
    @browser = browser
  end

  def goto(url)
    @browser.goto url
  end

  def get_url
    @browser.url
  end

  def click_back
    @browser.execute_script('window.history.back()')
    end

  def refresh
    @browser.refresh
   end

  def wait_present(element)
    i = 1
    count = 20
    interval = 1

    until element.present? || (i > count)
      sleep interval
      i += 1
    end
  end

  def wait_present_tmp(element, count=5, interval=1)

    count.times do
      return if element.present?
      sleep interval
    end
    raise Watir::TimeCollection::Exception.new("Wait Present: ELEMENT NOT FOUND!!!")
  end

  def wait_present?(element, count=5, interval=1)

    count.times do
      return true if element.present?
      sleep interval
    end
    return false
  end


  def wait_not_present(element)
    i = 1
    count = 20
    interval = 1

    until element.stale? || (i > count)
      sleep interval
      i += 1
    end
  end

  def wait_exist(element)
    i = 1
    count = 20
    interval = 1

    until element.exists? || (i > count)
      sleep interval
      i += 1
    end
  end
end
