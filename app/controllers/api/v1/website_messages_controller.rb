class Api::V1::WebsiteMessagesController < Api::V1::BaseController

  def contact_us
    create_website_message("Contact")
  end

  def join_us
    create_website_message("Join")
  end

  

  private



  def create_website_message(message_type)
    @website_message = WebsiteMessage.new(website_message_params)
    @website_message.message_type = message_type
    if @website_message.save
        render json: { message: "Message sent successfully." }, status: :ok
    else
      render json: @website_message.errors, status: :unprocessable_entity
    end
  end


  def website_message_params
      params.require(:website_message).permit(:sender_name, :sender_email, 
      :message_subject, :message_content, :interest)
  end
  

 
end