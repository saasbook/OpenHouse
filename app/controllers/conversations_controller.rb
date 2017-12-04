class ConversationsController < ApplicationController
    before_action do
        @user = current_user
    end
    
    def index
        @user = current_user
        @users = User.all
        @conversations = Conversation.all
    end
    
    def create
        if Conversation.between(params[:sender_id],params[:recipient_id]).present?
            @conversation = Conversation.between(params[:sender_id], params[:recipient_id]).first
        else
            @conversation = Conversation.create!(conversation_params)
        end
        redirect_to conversation_messages_path(@conversation)
    end
    
    def send_request
        
        id = params[:id]
        
        
        if Conversation.between(@user.id, id).present?
            @conversation = Conversation.between(@user.id, id).first
        else
            @conversation = Conversation.create!({sender_id: @user.id, recipient_id: id})
        end
        
        # Send a message
        message_params = {body: "I would like to reserve your place.", user_id: @user.id}
        @message = @conversation.messages.new(message_params)
        if @message.save
            flash[:notice] = "Your request has been sent."
            redirect_to :back
        end
    end
    
private
    def conversation_params
        params.permit(:sender_id, :recipient_id)
    end
end