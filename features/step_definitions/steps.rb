

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


Then /^Verify correct sorting$/ do
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
