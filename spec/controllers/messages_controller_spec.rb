require 'rails_helper'
require 'spec_helper'
include SessionsHelper

describe MessagesController do
  before(:each) do
    @user = FactoryGirl.create(:user)
    conversation = Conversation.create!(id: 1, sender_id: 1, recipient_id: 2)
    Message.create!(body: 'hello. This is a message.', conversation_id: conversation.id, user_id: 1)
  end
  describe 'show messages' do
    it 'shows the messages when you click on a conversation' do
      log_in(@user)
      get :index, {conversation_id: 1}
      expect(response).to render_template(:index)
    end
    it 'shows only 10 messages when there are more' do
      conversation = Conversation.find_by(id: 1)
      for i in 0..11 do
        Message.create!(body: 'quiero un globo', conversation_id: conversation.id, user_id: 1)
      end
      log_in(@user)
      get :index, conversation_id: 1
      expect(assigns(:over_ten)).to equal(true)
    end
  end
end
