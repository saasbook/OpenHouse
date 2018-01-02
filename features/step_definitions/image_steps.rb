Then /^I should see a default house image/ do
    expect(page).to have_xpath("//img[contains(@src, '/assets/house-672e50044baea2f22fce12544d9dd1575e8ce89c5a0f0a09a24aa4b79a3d0607.jpg')]")
end

Then /^I should see a "(.*)" image/ do |img|
    expect(page).to have_xpath("//img[contains(@src, #{img})]")
end

Then /^I should see "(.*)" more pictures of the rental space/ do |num|
    num = num.to_i
    i = 0
    while (i < num)  do
        find("img", id: "more_image_#{i}")
        i +=1
    end
end

Then /^I should not see "(.*)" pictures of the rental space/ do |num|
    num = num.to_i - 1
    lambda do
        find("img", id: "more_image_#{num}")
    end.should raise_error(Capybara::ElementNotFound)
end

When /^I click on an image/ do
    pending
end

When /^"(.*)" upload a picture as "(.*)"/ do |name, type|
    user = User.find_by(first_name: name)
    # should be a permanent cloudinary id
    id = "hi4n78j6m/image/upload/v1510433109/sample.jpg"
    if type == "profile_picture"
        user.cloud_profile_picture_id = id
    elsif type == "house_picture"
        user.cloud_house_picture_id = id
    else
        user.cloud_house_image_ids.push(id)
    end
    user.save!
end

When /^"(.*)" upload another picture as "(.*)"/ do |name, type|
    user = User.find_by(first_name: name)
    # should be a permanent cloudinary id
    id = "demo/image/upload/8jsb1xofxdqamu2rzwt9q.jpg"
    if type == "profile_picture"
        user.cloud_profile_picture_id = id
    elsif type == "house_picture"
        user.cloud_house_picture_id = id
    else
        user.cloud_house_image_ids.push(id)
    end
    user.save!
end

And /^I press the "(.*)" button/ do |name|
    click_button name
end

Then /^I should see an error with a message containing "([^"]+)"(?: and "([^"]+)")?/ do |message1, message2|
    expect(page).to have_xpath("//p", text: message1)
    expect(page).to have_xpath("//p", text: message2)
end

Then /the "(.*)" should be added to the post/ do |type|
    # expect(page).to have_xpath("//img", id: type)
    find("img", id: type)
end

Then /"(.*)" should have another picture as "(.*)"/ do |name, type|
    # expect(page).to have_xpath("//img", id: type)
    # First test, make sure the image exists
    find("img", id: type)
    
    user = User.find_by(first_name: name)
    
    #the second permanent image
    id = "demo/image/upload/8jsb1xofxdqamu2rzwt9q.jpg"
    
    success = false
    if type == "profile_picture"
        data = user.cloud_profile_picture_id
    elsif type == "house_picture"
        data = user.cloud_house_picture_id
    else
        user.cloud_house_image_ids.each do |data|
            if data == id
                success = true
            end
        end
    end
    # Second test, it should be id
    if (not success) and (data != id)
        fail(ArgumentError.new('Should be equal to id'))
    end
end

Then /the file should not have been uploaded by "(.*)"/ do |e|
    user = User.find_by(email: e)
    expect(File.exists?(Rails.root.join('app', 'assets', 'images', 'user_images',user.email, 'invalid.file'))).to be false
end
