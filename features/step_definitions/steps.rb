

#Scenario1: Main page functionality - header navigation

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

#Scenario2: Main page functionality - footer navigation

Then /^Check footer menu "([^"]*)" with items$/ do |y|

  $driver.get "http://www.petsmart.com/"
  listofootsubmenu =$driver.find_elements :xpath => "//div[contains(@class, 'pet-footer-links-group')][position() >1][.//h3[contains(text(), '#{y}')]]//li/a"
  if listofootsubmenu.empty?
  then puts "try again"
  else puts listofootsubmenu.map  {|n| n.attribute("innerHTML")}
  end
end

# Scenario3-8: Main page functionality - external links - facebook/Hangouts/Twitter/Instagram/Pinterest/Youtube
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

#Scenario9: Main page functionality - upcoming events wrapper

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

#Scenario10: Dog - Food - sorting - price low to high

Then /^In dog menu go to food$/ do
  $driver.get "http://www.petsmart.com/"
  sleep 5
  element =  $driver.find_element :xpath => "//ul[@class = 'ws-common-list pet-main-nav']/li/a/span[@class = 'ws-category-title' and text()= 'Dog']"
  sleep 10
  $driver.mouse.move_to element
  element = $driver.find_element :xpath => "//li[contains(@class, 'ws-common-list-item pet-main-nav-item-level1')][1]//span[@class = 'ws-category-title' and text()='Food']"
  sleep 10
  element.click
end
# Then /^Set sorting to "Low to high"$/ do
#   #$driver.get "http://www.petsmart.com/dog/food/cat-36-catid-100004"
#   dropd = $driver.find_element(:xpath, "//select[@name = 'SortingAttribute']")
#   variable = $dropdown.new(dropd)
#   variable.select_by(:value, 'ProductSalePrice-asc')
#   sleep 5
#   end
Then /^Set sorting to "Low to high" and verify correct sorting$/ do
  $driver.get "http://www.petsmart.com/dog/food/cat-36-catid-100004"
  sleep 8
  price =  $driver.find_elements :xpath =>"//div[@class = 'ws-group pet-prodloop']//span[contains(@class, 'kor-product-sale-price-value') and normalize-space(text())]"
  next_page = $driver.find_elements(:xpath, "//a[@class = 'ws-product-listing-pagination-link' and text() = 'to next page']")
  sleep 7
  arrayPrices = []
  while next_page.count > 0
    for j in price
      arrayPrices.push(j.text)
    end
    next_page[0].click
    sleep 7
    price =  $driver.find_elements :xpath =>"//div[@class = 'ws-group pet-prodloop']//span[contains(@class, 'kor-product-sale-price-value') and normalize-space(text())]"
    next_page = $driver.find_elements(:xpath, "//a[@class = 'ws-product-listing-pagination-link' and text() = 'to next page']")
  end
  for j in price
    sleep 3
    arrayPrices.push(j.text)
  end
  puts "All prices from 46 pages"
  puts arrayPrices
  arrayPricesSignRemove = []
  for i in arrayPrices do
    arrayPricesSignRemove.push(i.gsub!('$', ''))
  end
  arrayPricesModified = []
  for i in arrayPricesSignRemove do
    if i.include?('to')
      arrayPricesModified.push(i.split('to')[0].to_f)
    else
      arrayPricesModified.push(i.to_f)
    end
  end
  puts "Prices from all pages modified:"
  puts arrayPricesModified
  dropd = $driver.find_element(:xpath, "//select[@name = 'SortingAttribute']")
  variable = $dropdown.new(dropd)
  variable.select_by(:value, 'ProductSalePrice-asc')
  sleep 15
  pricesoted =  $driver.find_elements :xpath =>"//div[@class = 'ws-group pet-prodloop']//span[contains(@class, 'kor-product-sale-price-value') and normalize-space(text())]"
  next_page = $driver.find_elements(:xpath, "//a[@class = 'ws-product-listing-pagination-link' and text() = 'to next page']")
  sleep 7
  arraypricessorted = []
  while next_page.count > 0
    for j in pricesoted
      arraypricessorted.push(j.text)
    end
    next_page[0].click
    sleep 7
    pricesoted  =  $driver.find_elements :xpath =>"//div[@class = 'ws-group pet-prodloop']//span[contains(@class, 'kor-product-sale-price-value') and normalize-space(text())]"
    next_page = $driver.find_elements(:xpath, "//a[@class = 'ws-product-listing-pagination-link' and text() = 'to next page']")
  end
  for j in pricesoted
    sleep 3
    arraypricessorted.push(j.text)
  end
  puts "All sorted prices from 46 pages"
  puts arraypricessorted
  arraypricesSortedSignRemove = []
  for i in arraypricessorted do
    arraypricesSortedSignRemove.push(i.gsub!('$', ''))
  end
  arrayPricesSortedModified = []
  for i in arraypricesSortedSignRemove do
    if i.include?('to')
      arrayPricesSortedModified.push(i.split('to')[0].to_f)
    else
      arrayPricesSortedModified.push(i.to_f)
    end
  end
  puts "Prices from all pages modified:"
  puts arrayPricesSortedModified
  x = arrayPricesModified.sort
  puts "Sorted for testing"
  puts x
  if x ==  arrayPricesSortedModified
    puts 'Prices sorted correct'
  else raise "BUG!!! Sorting by Price Low to High is not correct!!!"
  end
end

#Scenario11: Main page functionality - search - valid search

Then /^In search type ([^"]*)$/ do |x|
  $driver.get "http://www.petsmart.com/"
  sleep 3
  element = $driver.find_element(:id, "searchForm")
  element.send_keys x
  sleep 3
  searchbutton  = $driver.find_element(:xpath, "//button[@class = 'ws-search-submit']")
  searchbutton.click
  sleep 3
end

Then /^Check that some results returned ([^"]*)$/ do |y|
  items = $driver.find_elements(:xpath, "//h4[@class = 'ws-product-title fn']")

for i in items
  if i.text.include? y
    puts "Item contain text:" + y + "Item:" + i.text
  else raise "BUG!!!"
  end
end
end

#Scenario12: Main page functionality - search - invalid search

Then /^Check that no results "([^"]*)" returned and message "([^"]*)"$/ do |word, message|
  item = $driver.find_element(:xpath, "//div[@class = 'ws-group pet-heading-group pet-search-title pet-dym-title-top']//h1[@class = 'ws-heading']")
   if item.text.include? message
      puts "No reults for: " + word + " Displayed message is: " + message
   else raise "BUG!!! Check searched word"
   end
  end

#Scenario13: Main page functionality - pet services wrapper
Then /^in Pet service click on each item and verify that all promo messages are different$/ do
  $driver.get "http://www.petsmart.com/"
  sleep 5
  servicemenu = $driver.find_elements(:xpath, "//ul[@class = 'pet-services__nav']//a")
  message = $driver.find_elements(:xpath, "//h3[@style = 'color: #fff;']")
  sleep 4
  messages = []
  n = 0
  for i in servicemenu do
    i.click
    y = message[n].text.to_s
    sleep 3
    messages.push(y)
    n = n+1
  end
  puts "Array of messages:"
  puts messages
   messages2 = messages.uniq
    if messages == messages2
      puts "All messages are different"
    else raise "BUG!!! You have duplicates"
    end
end

#Scenario14: Dog - Food and health - Brands
Then /^In "Dog" menu go to "Food & health"$/ do
  $driver.get("http://www.petsmart.com/small-pet/food-care/cat-36-catid-100001")
  sleep 2
end
Then /^In "Featured Brands" check that each brand navigates to the page with brand specific items$/ do
  list_of_brands = $driver.find_elements(:xpath, "//div[contains(@class, 'layout__content-width-column--fith gutter')]//img[@alt]")
  sleep 3
  n = 1
  for i in list_of_brands do
    brand = $driver.find_element(:xpath, "(//div[contains(@class, 'layout__content-width-column--fith gutter')]//img[@alt])["+n.to_s+"]")
    m = brand.attribute('alt')
    puts "Icon name is  " + m
    brand.click
    sleep 5
    items = $driver.find_elements(:xpath, "//h4[@class = 'ws-product-title fn']")
    for b in items do
      if b.text.include? "'"
        b = b.text.gsub!("'", "").upcase
      elsif b.text.upcase.include? "GREAT"
        b = b.text.upcase.gsub!("GREAT", "GRREAT").upcase
      else
        b = b.text.upcase
      end
      if b.include? m.upcase.split()[0] or b.include? m
        puts "Page contains specific brand  " + m + "." + "  Item is:  " + b
      else raise "Item doesn't have brand  " + m + "Item name is    ." + b
      end
    end
    sleep 5
    $driver.navigate.back
    sleep 8
    n = n+1
  end
  sleep 5
end
#Scenario15 Dog - Food - comparing - adding 2 items
Then /^In "Dog" menu go to "Food"$/ do
  $driver.get("http://www.petsmart.com/dog/food/cat-36-catid-100004")
  sleep 5
end
Then /^Add 2 random items into compare mode$/ do
  items = $driver.find_elements(:xpath, "//div[contains(@class, 'ws-group pet-family-content pet-content')]//input[@class = 'ws-compare-link-checkbox' and @type = 'checkbox']")
  for i in 0..1 do
    items.sample.click
    sleep 2
  end
  checkeditems = []
  items2 = $driver.find_elements(:xpath, "//div[contains(@class, 'ws-group pet-family-content pet-content')]//input[@class = 'ws-compare-link-checkbox' and @type = 'checkbox']")
  for i in items2 do
    if i.selected?
      checkeditems.push(i)
    end
  end
  puts "All fine " + checkeditems.length.to_s +  " items were added to comparison"
end
#Scenario16: Dog - Food - comparing - adding 3 items
Then /^Add 3 random items into compare mode$/ do
  items = $driver.find_elements(:xpath, "//div[contains(@class, 'ws-group pet-family-content pet-content')]//input[@class = 'ws-compare-link-checkbox' and @type = 'checkbox']")
  for i in 0..2 do
    items.sample.click
    sleep 2
  end
end
#Scenario17: Dog - Food - comparing - adding more then 3 items
Then /^Add 4 random items into compare mode$/ do
  items = $driver.find_elements(:xpath, "//div[contains(@class, 'ws-group pet-family-content pet-content')]//input[@class = 'ws-compare-link-checkbox' and @type = 'checkbox']")
  for i in 0..3 do
    items.sample.click
    sleep 2
  end
  message  = $driver.find_elements(:xpath, "//div[@class = 'kor-overlay-content']/div")
  if alert.count > 0
    puts "Error message: " + message.text
  else raise "Something wrong. Message is not displayed"
  end
end


# Then /^Login to gmail$/ do
#   login = 't.d.markit@gmail.com'
#   password = 'Poipoipoi1'
#   gmail = Gmail.connect(login, password)
#   # puts gmail.loged_in?
#    gmail.inbox.count(:unread)
#   # gmail.logout
#
# end
# Then /^New prices$/ do
#   price =  $driver.find_elements :xpath =>"//div[@class = 'ws-group pet-prodloop']//span[contains(@class, 'kor-product-sale-price-value')and normalize-space(text())]"
#   puts price.map  {|n| n.attribute("innerHTML")}
#   array = []
#   for i in price do
#      a = i.text
#      b = a.gsub!('$', '')
#      array.push(b)
#   end
#   puts array
#   array2 = []
#   for i in array do
#       if i.include?('to')
#         a =  i.split('to')[0].to_f
#         array2.push(a)
#       else
#         b = i.to_f
#         array2.push(b)
#       end
# 
#    end
#   puts array2
#   for i in array2 do
#     if i <= i+1
#       puts "Sorting is wrongt"
#     else
#       puts "Sorting is correct"
#     end
# 
#   end
# end


# Then /^Collect all prices from all pages$/ do
#   $driver.get "http://www.petsmart.com/dog/food/cat-36-catid-100004"
#   sleep 5
#   price =  $driver.find_elements :xpath =>"//div[@class = 'ws-group pet-prodloop']//span[contains(@class, 'kor-product-sale-price-value') and normalize-space(text())]"
#   next_page = $driver.find_elements(:xpath, "//a[@class = 'ws-product-listing-pagination-link' and text() = 'to next page']")
#   sleep 5
#   array = []
#   while next_page.count > 0
#     #puts price.map  {|n| n.attribute("innerHTML")}
#     for j in price
#       a = j.text
#       array.push(a)
#     end
#     next_page[0].click
#     sleep 7
#     price =  $driver.find_elements :xpath =>"//div[@class = 'ws-group pet-prodloop']//span[contains(@class, 'kor-product-sale-price-value') and normalize-space(text())]"
#     next_page = $driver.find_elements(:xpath, "//a[@class = 'ws-product-listing-pagination-link' and text() = 'to next page']")
#   end
#   for j in price
#     b = j.text
#     array.push(b)
#   end
#   puts "All prices"
#   puts array
#
#   array2 = []
#   for i in array do
#     y = i.gsub!('$', '')
#     array2.push(i)
#   end
#   array3 = []
#   for i in array2 do
#     if i.include?('to')
#       a =  i.split('to')[0].to_f
#       array3.push(a)
#     else
#       b = i.to_f
#       array3.push(b)
#     end
#
#   end
#   puts "All prices modified"
#   puts array3
#   for i in array3 do
#     if i < i+1
#       puts "All good"
#     else
#     end
#   end
# end
#

