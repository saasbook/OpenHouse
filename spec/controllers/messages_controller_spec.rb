require 'rails_helper'
require 'spec_helper'
include SessionsHelper

describe MessagesController do
  before(:each) do
    @user = FactoryGirl.create(:user)
    conversation = Conversation.create!(id: 1, sender_id: 1, recipient_id: 2)
    Message.create!(body: 'hello. This is a message.', conversation_id: conversation.id, user_id: 1)
    log_in(@user)
  end
  describe 'show messages' do
    it 'shows the messages when you click on a conversation' do
      get :index, {conversation_id: 1}
      expect(response).to render_template(:index)
    end
    it 'shows only 10 messages when there are more' do
      conversation = Conversation.find_by(id: 1)
      for i in 0..11 do
        Message.create!(body: 'quiero un globo', conversation_id: conversation.id, user_id: 1)
      end
      get :index, conversation_id: 1
      expect(assigns(:over_ten)).to equal(true)
    end
    it 'does the :m thing I guess??' do
      get :index, conversation_id: 1, m: true
    end
  end
  describe 'making new messages' do
    it 'creates new messages' do
      conversation = Conversation.find_by(id: 1)
      post :create, conversation_id: 1, message: {body: 'pizza, pasta, put it in a box', user_id: 1}
      expect(response).to redirect_to(conversation_messages_path(conversation))
      post :create, conversation_id: 1, message: {body: ''}
      expect(response).to redirect_to(conversation_messages_path(conversation))
    end
  end
end
