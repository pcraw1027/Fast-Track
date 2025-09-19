class WebsiteMessagesController < ApplicationController
  before_action :set_website_message, only: %i[ show edit update destroy ]

  # GET /website_messages or /website_messages.json
  def index
    @website_messages = WebsiteMessage.all.paginate(page: params[:page], per_page: 20).order(
      created_at: :desc, id: :desc
    )
  end

  # GET /website_messages/1 or /website_messages/1.json
  def show
  end

  # GET /website_messages/new
  def new
    @website_message = WebsiteMessage.new
  end

  # GET /website_messages/1/edit
  def edit
  end

  # POST /website_messages or /website_messages.json
  def create
    @website_message = WebsiteMessage.new(website_message_params)

    respond_to do |format|
      if @website_message.save
        format.html { redirect_to @website_message, notice: "Website message was successfully created." }
        format.json { render :show, status: :created, location: @website_message }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @website_message.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /website_messages/1 or /website_messages/1.json
  def update
    respond_to do |format|
      if @website_message.update(website_message_params)
        format.html { redirect_to @website_message, notice: "Website message was successfully updated." }
        format.json { render :show, status: :ok, location: @website_message }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @website_message.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /website_messages/1 or /website_messages/1.json
  def destroy
    @website_message.destroy

    respond_to do |format|
      format.html { redirect_to website_messages_path, status: :see_other, notice: "Website message was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_website_message
      @website_message = WebsiteMessage.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def website_message_params
      params.require(:website_message).permit(:sender_name, :sender_email, :message_type, :message_subject, :message_content, :sender_response_sent, :internal_response_sent, :initial_response, :initial_response_date, :conclusion)
    end
end
