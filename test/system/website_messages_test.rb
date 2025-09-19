require "application_system_test_case"

class WebsiteMessagesTest < ApplicationSystemTestCase
  setup do
    @website_message = website_messages(:one)
  end

  test "visiting the index" do
    visit website_messages_url
    assert_selector "h1", text: "Website Messages"
  end

  test "creating a Website message" do
    visit website_messages_url
    click_on "New Website Message"

    fill_in "Conclusion", with: @website_message.conclusion
    check "Initial response" if @website_message.initial_response
    fill_in "Initial response date", with: @website_message.initial_response_date
    check "Internal response sent" if @website_message.internal_response_sent
    fill_in "Message content", with: @website_message.message_content
    fill_in "Message subject", with: @website_message.message_subject
    fill_in "Message type", with: @website_message.message_type
    fill_in "Sender email", with: @website_message.sender_email
    fill_in "Sender name", with: @website_message.sender_name
    check "Sender response sent" if @website_message.sender_response_sent
    click_on "Create Website message"

    assert_text "Website message was successfully created"
    click_on "Back"
  end

  test "updating a Website message" do
    visit website_messages_url
    click_on "Edit", match: :first

    fill_in "Conclusion", with: @website_message.conclusion
    check "Initial response" if @website_message.initial_response
    fill_in "Initial response date", with: @website_message.initial_response_date
    check "Internal response sent" if @website_message.internal_response_sent
    fill_in "Message content", with: @website_message.message_content
    fill_in "Message subject", with: @website_message.message_subject
    fill_in "Message type", with: @website_message.message_type
    fill_in "Sender email", with: @website_message.sender_email
    fill_in "Sender name", with: @website_message.sender_name
    check "Sender response sent" if @website_message.sender_response_sent
    click_on "Update Website message"

    assert_text "Website message was successfully updated"
    click_on "Back"
  end

  test "destroying a Website message" do
    visit website_messages_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Website message was successfully destroyed"
  end
end
