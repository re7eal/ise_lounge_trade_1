class TradeMessagesController < ApplicationController
  before_action :set_trade_message, only: [:show, :edit, :update, :destroy]

  # GET /trade_messages
  # GET /trade_messages.json
  def index
    @trade_messages = TradeMessage.all
  end

  # GET /trade_messages/1
  # GET /trade_messages/1.json
  def show
  end

  # GET /trade_messages/new
  def new
    @trade_message = TradeMessage.new
  end

  # GET /trade_messages/1/edit
  def edit
  end

  # POST /trade_messages
  # POST /trade_messages.json
  def create
    @trade_message = TradeMessage.new(trade_message_params)

    respond_to do |format|
      if @trade_message.save
        format.html { redirect_to @trade_message, notice: 'Trade message was successfully created.' }
        format.json { render action: 'show', status: :created, location: @trade_message }
      else
        format.html { render action: 'new' }
        format.json { render json: @trade_message.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /trade_messages/1
  # PATCH/PUT /trade_messages/1.json
  def update
    respond_to do |format|
      if @trade_message.update(trade_message_params)
        format.html { redirect_to @trade_message, notice: 'Trade message was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @trade_message.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /trade_messages/1
  # DELETE /trade_messages/1.json
  def destroy
    @trade_message.destroy
    respond_to do |format|
      format.html { redirect_to trade_messages_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_trade_message
      @trade_message = TradeMessage.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def trade_message_params
      params.require(:trade_message).permit(:content, :user_id, :trade_id)
    end
end
