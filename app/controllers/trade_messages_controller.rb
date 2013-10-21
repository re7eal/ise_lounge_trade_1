class TradeMessagesController < ApplicationController
  respond_to :json

  def index
    respond_with TradeMessage.all
  end
 
  def show
    respond_with TradeMessage.find(params[:id])
  end
 
  def create
    respond_with TradeMessage.create(params[:trade_message])
  end
 
  def update
    respond_with TradeMessage.update(params[:id], params[:trade_message])
  end
 
  def destroy
    respond_with TradeMessage.destroy(params[:id])
  end

end
