json.extract! website_message, :id, :sender_name, :sender_email, :interest, :message_type, 
:message_subject, :message_content, :sender_response_sent, :internal_response_sent, :initial_response, 
:initial_response_date, :conclusion, :created_at, :updated_at
json.url website_message_url(website_message, format: :json)
