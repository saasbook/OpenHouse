require 'rails_helper'
require 'spec_helper'

describe ConversationsController do
  describe 'show conversations' do
    it 'shows the main conversations page' do
      get :index
      expect(response).to render_template(:index)
    end
  end
end
