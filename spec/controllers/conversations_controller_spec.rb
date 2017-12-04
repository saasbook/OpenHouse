require 'rails_helper'
require 'spec_helper'

describe ConversationsController do
  before(:each) do
    @parameters = {email: 'new.johnson222001@gmail.com',
                   password: 'openhouse',
                   first_name: 'Hunter',
                   last_name: 'Johnson',
                   personal_description: "Hi, I'm Hunter!",
                   billing_first_name: 'Hunter',
                   billing_last_name: 'Johnson',
                   billing_street_address: '4070 Opal Street',
                   billing_city: 'Oakland',
                   billing_state: 'CA',
                   billing_zip_code: '94609',
                   credit_card_number: '1234567812345678',
                   expiration_date: '01/23',
                   cvv: '123',
                   home_street_address: '4070 Opal Street',
                   home_city: 'Oakland',
                   home_state: 'CA',
                   home_zip_code: '94609',
                   house_description: "Hi! I am a software engineer freelancing and working at home most of the time. I have a large and quiet kitchen with a dedicated working desk in a big, newly-refurbished Victorian house. Private, secluded, and with natural light. Five minutes' walk from MacArthur BART Station and parking is easy. It would suit around three people. Feel free to use the renovated and fully equipped kitchen! Otherwise, there are cafes and restaurants a short five minute walk away on Telegraph. Keep in touch should you need any further information!",
                   searchable: true,
                   price: "22",
                   available_time_start: "09:00",
                   available_time_end: "17:00",
                   amenity_list: AmenityList.create!(wifi: true, coffee: true, computer_desk: true, kitchen_access: true, microwave: true),
                   profile_picture: 'hunter-johnson-222001.jpg',
                   house_picture: 'neonbrand-263851.jpg',
                   capacity: '3',
                   title: 'Comfortable and equipped kitchen with working desk'}
                   
    @sender = User.create!(email: 'bob.johnson222001@gmail.com',
                 password: 'openhouse',
                 first_name: 'Hunter',
                 last_name: 'Johnson',
                 personal_description: "Hi, I'm Hunter!",
                 billing_first_name: 'Hunter',
                 billing_last_name: 'Johnson',
                 billing_street_address: '4070 Opal Street',
                 billing_city: 'Oakland',
                 billing_state: 'CA',
                 billing_zip_code: '94609',
                 credit_card_number: '1234567812345678',
                 expiration_date: '01/23',
                 cvv: '123',
                 home_street_address: '4070 Opal Street',
                 home_city: 'Oakland',
                 home_state: 'CA',
                 home_zip_code: '94609',
                 house_description: "Hi! I am a software engineer freelancing and working at home most of the time. I have a large and quiet kitchen with a dedicated working desk in a big, newly-refurbished Victorian house. Private, secluded, and with natural light. Five minutes' walk from MacArthur BART Station and parking is easy. It would suit around three people. Feel free to use the renovated and fully equipped kitchen! Otherwise, there are cafes and restaurants a short five minute walk away on Telegraph. Keep in touch should you need any further information!",
                 searchable: true,
                 price: "22",
                 available_time_start: "09:00",
                 available_time_end: "17:00",
                 amenity_list: AmenityList.create!(wifi: true, coffee: true, computer_desk: true, kitchen_access: true, microwave: true),
                 profile_picture: 'hunter-johnson-222001.jpg',
                 house_picture: 'neonbrand-263851.jpg',
                 capacity: '3',
                 title: 'Comfortable and equipped kitchen with working desk')

    @recipient = User.create!(email: 'bob.peyton220268@gmail.com',
                 password: 'openhouse',
                 first_name: 'Kyle',
                 last_name: 'Peyton',
                 personal_description: "Hi, I'm Kyle!",
                 billing_first_name: 'Kyle',
                 billing_last_name: 'Peyton',
                 billing_street_address: '3845 Market Street',
                 billing_city: 'Oakland',
                 billing_state: 'CA',
                 billing_zip_code: '94608',
                 credit_card_number: '1234567812345678',
                 expiration_date: '01/23',
                 cvv: '123',
                 home_street_address: '3845 Market Street',
                 home_city: 'Oakland',
                 home_state: 'CA',
                 home_zip_code: '94608',
                 house_description: "I'm running a hedge fund in my garage and am looking for people to co-work with. I have monitors and enough seating space at a great table. Free Colombian coffee and ultra-fast WiFi! If you're doing some artistic activity, there is some space here to paint. Just make sure to contact me beforehand to make that happen! Come live the american dream!",
                 searchable: true,
                 price: "10",
                 available_time_start: "09:00",
                 available_time_end: "17:00",
                 amenity_list: AmenityList.create!(wifi: true, coffee: true, computer_desk: true, garage: true, art_space: true),
                 profile_picture: 'kyle-peyton-220268.jpg',
                 house_picture: 'mounzer-awad-348688.jpg',
                 capacity: '6',
                 title: 'Come co-work in my garage')
  end
  describe 'show conversations' do
    it 'shows the main conversations page' do
      get :index
      expect(response).to render_template(:index)
    end
  end
  describe 'create conversations' do
    it 'should use an existing conversation if one already exists' do
      @conversation = Conversation.create!({sender_id: @sender.id, recipient_id: @recipient.id})
      post :create, {sender_id: @sender.id, recipient_id: @recipient.id}
      expect(assigns(:conversation)).to eq(@conversation)
      expect(response).to redirect_to(conversation_messages_path(@conversation))
    end
    it "should create new conversation if it doesn't exist" do
      post :create, {sender_id: @sender.id, recipient_id: @recipient.id}
      @conversation = Conversation.between(@sender.id, @recipient.id).first
      expect(assigns(:conversation)).to eq(@conversation)
      expect(response).to redirect_to(conversation_messages_path(@conversation))
    end
  end
  describe 'send request' do
  #   it 'should use an existing conversation if one already exists' do
  #     post :create, :user => @parameters
		# 	@sender = User.find_by(:email => "new.johnson222001@gmail.com")
  #     @conversation = Conversation.create!({sender_id: @sender.id, recipient_id: @recipient.id})
  #     get :send_request, {id: @recipient.id}
  #     expect(assigns(:conversation)).to eq(@conversation)
  #   end
    # it "should create new conversation if it doesn't exist" do
    #   post :create, :user => @parameters
    #   @sender = User.find_by(:email => "new.johnson222001@gmail.com")
    #   get :send_request, {id: @recipient.id}
    #   @conversation = Conversation.between(@sender.id, @recipient.id).first
    #   expect(assigns(:conversation)).to eq(@conversation)
    # end
  end
end
