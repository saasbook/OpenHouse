Given /the user accounts exist/ do |users_table|
  temp = ""
  users_table.hashes.each do |user|
    User.create user
    #temp = user
  end
  #User.where(username: $1).first.username
  #temp = User.all.inspect
  #puts(@temp)
  temp = User.first
  visit("/users/new") 
  #puts page.body
  fill_in("Username", :with => temp.username)
  fill_in("Password", :with => temp.password)
  fill_in("Full Name", :with => temp.name)
  fill_in("user_credit_card_number", :with => temp.credit_card_number)
  #element = page.find("Credit Card")
  #element.set(temp.credit_card_number)
  fill_in("E-Mail", :with => temp.email)
  fill_in("Address", :with => temp.address)
  click_button("Submit")
end