

Then /^Check that menu item "([^"]*)" contains submenus$/ do |x|

  $driver.get "http://www.petsmart.com/"
  sleep 5
  element = $driver.find_element :xpath => "//span[@class='ws-category-title' and text() = '#{x}']"
  element.click
  sleep 10
  listofsubmenu =$driver.find_elements :xpath => "//li[@class='ws-category-list-item ws-category-list-item-1 ws-category-list-item-odd pet-leftnav-family-item pet-leftnav-level1-item']"
  if listofsubmenu.empty?
  then puts "fgfgfgfgffg"
  else puts "we are the winners"

  end
end

#$x("//div[contains(@class, 'pet-footer-links-group')][position() >1]")
#puts "Footer items are fine"

Then /^Check footer menu "([^"]*)" with items$/ do |y|

  $driver.get "http://www.petsmart.com/"
  listofootsubmenu =$driver.find_elements :xpath => "//div[contains(@class, 'pet-footer-links-group')][position() >1][.//h3[contains(text(), '#{y}')]]//li/a"
  if listofootsubmenu.empty?
  then puts "try again"
  else puts listofootsubmenu.map  {|n| n.attribute("innerHTML")}
  end
end


Then /^Click on "([^"]*)" icon$/ do |icon|
  $driver.get "http://www.petsmart.com/"
  sleep 5
  element = $driver.find_element :xpath => "//a[@title= '#{icon}']"
  element.click
  sleep 8
end

Then /^Verify navigation to "([^"]*)"$/ do |site|
  $driver.switch_to.window $driver.window_handles.last
  assert $driver.title == "#{site}"
end



Then /^Verify user navigate to "([^"]*)"$/ do |site2|
  $driver.switch_to.window $driver.window_handles.last
  $driver.find_element(:xpath, "//title[contains(text(), '#{site2}')]").text.include? "'#{site2}'"
end

Then /^Print out all upcoming events in wrapper$/ do
  $driver.get "http://www.petsmart.com/"
  listofevents =$driver.find_elements(:xpath, "//div[@class = 'monthly-event-title']/span")
  if listofevents.empty?
  then puts "No events"
  else puts listofevents.map  {|n| n.attribute("innerHTML")}
  end
end

Then /^In dog menu go to food$/ do
  $driver.get "http://www.petsmart.com/"
  sleep 10
  element =  $driver.find_element :xpath => "//ul[@class = 'ws-common-list pet-main-nav']/li/a/span[@class = 'ws-category-title' and text()= 'Dog']"
  sleep 10
  $driver.mouse.move_to element
  element = $driver.find_element :xpath => "//li[contains(@class, 'ws-common-list-item pet-main-nav-item-level1')][1]//span[@class = 'ws-category-title' and text()='Food']"
  sleep 10
  element.click
end
