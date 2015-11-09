

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

#Then /^In dog menu go to food$/ do
#   $driver.get "http://www.petsmart.com/"
#   sleep 5
#   element =  $driver.find_element :xpath => "//ul[@class = 'ws-common-list pet-main-nav']/li/a/span[@class = 'ws-category-title' and text()= 'Dog']"
#   sleep 10
#   $driver.mouse.move_to element
#   element = $driver.find_element :xpath => "//li[contains(@class, 'ws-common-list-item pet-main-nav-item-level1')][1]//span[@class = 'ws-category-title' and text()='Food']"
#   sleep 10
#   element.click
# end

Then /^Set sorting to "Low to high"$/ do
  $driver.get "http://www.petsmart.com/dog/food/cat-36-catid-100004"
  dropd = $driver.find_element(:xpath, "//select[@name = 'SortingAttribute']")
  variable = $dropdown.new(dropd)
  variable.select_by(:value, 'ProductSalePrice-asc')
  sleep 5

end
# Then /^Set sorting to Price Low to High and verify correct sorting$/ do
#   item_prices = $driver.find_elements(:xpath, "//div[@class = 'ws-group pet-prodloop']//span[contains(@class, 'kor-product-sale-price-value')]")
#   next_page = $driver.find_elements(:xpath, "//a[@class = 'ws-product-listing-pagination-link' and text() = 'to next page']")
#   array_1 = []
#   while next_page.count > 0
#     for i in item_prices
#       a = i.text
#       array_1.push(a)
#     end
#     next_page[0].click
#     sleep 5
#     item_prices = $driver.find_elements(:xpath, "//div[@class = 'ws-group pet-prodloop']//span[contains(@class, 'kor-product-sale-price-value')]")
#     next_page = $driver.find_elements(:xpath, "//a[@class = 'ws-product-listing-pagination-link' and text() = 'to next page']")
#   end
#   for i in item_prices
#     a = i.text
#     array_1.push(a)
#   end
#   puts "Array of prices - unsorted:"
#   puts array_1
#   array_1_modified = []
#   for j in array_1
#     b = j.gsub!('$ ', '')
#     c = b[0..4].to_f
#     array_1_modified.push(c)
#   end
#   puts "Array of prices - unsorted - modified:"
#   puts array_1_modified
#   ddown = $driver.find_element(:xpath, "//select[@name = 'SortingAttribute']")
#   sel_from_ddown = Selenium::WebDriver::Support::Select.new(ddown)
#   sel_from_ddown.select_by(:value,"ProductSalePrice-asc")
#   sleep 15
#   item_prices_sorted = $driver.find_elements(:xpath, "//div[@class = 'ws-group pet-prodloop']//span[contains(@class, 'kor-product-sale-price-value')]")
#   next_page_1 = $driver.find_elements(:xpath, "//a[@class = 'ws-product-listing-pagination-link' and text() = 'to next page']")
#   array_2 = []
#   while next_page_1.count > 0
#     for k in item_prices_sorted
#       d = k.text
#       array_2.push(d)
#     end
#     next_page_1[0].click
#     sleep 5
#     item_prices_sorted = $driver.find_elements(:xpath, "//div[@class = 'ws-group pet-prodloop']//span[contains(@class, 'kor-product-sale-price-value')]")
#     next_page_1 = $driver.find_elements(:xpath, "//a[@class = 'ws-product-listing-pagination-link' and text() = 'to next page']")
#   end
#   for k in item_prices_sorted
#     d = k.text
#     array_2.push(d)
#   end
#   puts "Array of prices - after sorting:"
#   puts array_2
#   array_2_modified = []
#   for n in array_2
#     l = n.gsub!('$ ', '')
#     m = l[0..4].to_f
#     array_2_modified.push(m)
#   end
#   x = array_1_modified.sort
#   puts "Array of prices - after sorting - modified:"
#   puts array_2_modified
#   puts "Array sorted for verification purpose:"
#   puts x
#   sleep 3
#   if array_2_modified == x
#     puts "Items sorted correctly by Price Low to High."
#   else raise "BUG!!! Sorting by Price Low to High is not correct!!!"
#   end
# end

Then /^Verify correct sorting$/ do
  price =  $driver.find_elements :xpath =>"//div[@class = 'ws-group pet-prodloop']//span[contains(@class, 'kor-product-sale-price-value') and substring(normalize-space(text()), 2)]"
  next_page = $driver.find_elements(:xpath, "//a[@class = 'ws-product-listing-pagination-link' and text() = 'to next page']")
  sleep 5
  array1= []
  while next_page.count > 0
    puts price.map  {|n| n.attribute("innerHTML")}
    for j in price
      b = j.text
      array1.push(b)
    end
    next_page[0].click
    sleep 7
    price =  $driver.find_elements :xpath =>"//div[@class = 'ws-group pet-prodloop']//span[contains(@class, 'kor-product-sale-price-value') and substring(normalize-space(text()), 2)]"
    next_page = $driver.find_elements(:xpath, "//a[@class = 'ws-product-listing-pagination-link' and text() = 'to next page']")
  end
  for j in price
     b = j.text
     array1.push(b)
  end
  puts "All prices"
  puts array1
  array_modifyed = []
  for textarray1 in array1
    x = textarray1[3..6].to_f
    array_modifyed.push(x)
  end

  puts 'Modifyed array:'
  puts array_modifyed


end




  # if next_page.count == 0
  #   pricelast =  $driver.find_elements :xpath =>"//div[@class = 'ws-group pet-prodloop']//span[contains(@class, 'kor-product-sale-price-value')]"
  #   puts pricelast.map  {|n| n.attribute("innerHTML")}
  #   for j in pricelast
  #     b = j.text
  #     c = b[3..6].to_f
  #     array_1_modified.push(c)
  #   end

   #end


  # prices =  $driver.find_elements :xpath => "//div[@class = 'ws-group pet-prodloop']//span[contains(@class, 'kor-product-sale-price-value')and number(substring(normalize-space(text()), 2))]"
  # puts prices.map  {|n| n.attribute("innerHTML")}


