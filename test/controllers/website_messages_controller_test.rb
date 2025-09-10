require "test_helper"

class WebsiteMessagesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @website_message = website_messages(:one)
  end

  test "should get index" do
    get website_messages_url
    assert_response :success
  end

  test "should get new" do
    get new_website_message_url
    assert_response :success
  end

  test "should create website_message" do
    assert_difference('WebsiteMessage.count') do
      post website_messages_url, 
params: { website_message: { conclusion: @website_message.conclusion, 
initial_response: @website_message.initial_response, initial_response_date: @website_message.initial_response_date, 
internal_response_sent: @website_message.internal_response_sent, message_content: @website_message.message_content, 
message_subject: @website_message.message_subject, message_type: @website_message.message_type, 
sender_email: @website_message.sender_email, sender_name: @website_message.sender_name, 
sender_response_sent: @website_message.sender_response_sent } }
    end

    assert_redirected_to website_message_url(WebsiteMessage.last)
  end

  test "should show website_message" do
    get website_message_url(@website_message)
    assert_response :success
  end

  test "should get edit" do
    get edit_website_message_url(@website_message)
    assert_response :success
  end

  test "should update website_message" do
    patch website_message_url(@website_message), 
params: { website_message: { conclusion: @website_message.conclusion, 
initial_response: @website_message.initial_response, initial_response_date: @website_message.initial_response_date, 
internal_response_sent: @website_message.internal_response_sent, message_content: @website_message.message_content, 
message_subject: @website_message.message_subject, message_type: @website_message.message_type, 
sender_email: @website_message.sender_email, sender_name: @website_message.sender_name, 
sender_response_sent: @website_message.sender_response_sent } }
    assert_redirected_to website_message_url(@website_message)
  end

  test "should destroy website_message" do
    assert_difference('WebsiteMessage.count', -1) do
      delete website_message_url(@website_message)
    end

    assert_redirected_to website_messages_url
  end
end
