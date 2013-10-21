class TradesController < ApplicationController
  before_filter :authenticate_user!
  before_action :set_trade, only: [:show, :edit, :update, :destroy, :data]

  # GET /trades
  # GET /trades.json
  def index
    @trades = Trade.all
  end

  # GET /trades/1
  # GET /trades/1.json
  def show
  end

  # GET /trades/new
  def new
    @trade = Trade.new
  end

  # GET /trades/1/edit
  def edit
  end

  # POST /trades
  # POST /trades.json
  def create
    @trade = Trade.new(trade_params)
    @trade.finished = false
    @trade.user_id = current_user.id

    respond_to do |format|
      if @trade.save
        $trade_id = @trade.id
        format.html { redirect_to @trade, notice: 'Trade was successfully created.' }
        format.json { render action: 'show', status: :created, location: @trade }
      else
        format.html { render action: 'new' }
        format.json { render json: @trade.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /trades/1
  # PATCH/PUT /trades/1.json
  def update
    respond_to do |format|
      if @trade.update(trade_params)
        format.html { redirect_to @trade, notice: 'Trade was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @trade.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /trades/1
  # DELETE /trades/1.json
  def destroy
    @trade.destroy
    respond_to do |format|
      format.html { redirect_to trades_url }
      format.json { head :no_content }
    end
  end

  def data
    @user_name = @trade.user.name
    @trade_messages = @trade.trade_messages
    @have_courses = @trade.have_courses
    @want_courses = @trade.want_courses

    respond_to do |format|
      format.html { render :json => {:user_name => @user_name, :trade_messages => @trade_messages, :have_courses => @have_courses, :want_courses => @want_courses }}
      format.json { render :json => {:user_name => @user_name, :trade_messages => @trade_messages, :have_courses => @have_courses, :want_courses => @want_courses }}
    end
  end

  def my_trades
    @trades = Trade.where(:user_id => current_user.id)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_trade
      @trade = Trade.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def trade_params
      params.require(:trade).permit(:note, :finished, :user_id)
    end
end
