Then /^I should see a reserve message$/ do
    if page.driver.class == Capybara::Selenium::Driver
        page.driver.browser.switch_to.alert.text.should eq("Your request has been sent.")
    end
end