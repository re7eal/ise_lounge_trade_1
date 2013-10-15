class HavesController < ApplicationController
  before_action :set_hafe, only: [:show, :edit, :update, :destroy]

  # GET /haves
  # GET /haves.json
  def index
    @haves = Have.all
  end

  # GET /haves/1
  # GET /haves/1.json
  def show
  end

  # GET /haves/new
  def new
    @hafe = Have.new
  end

  # GET /haves/1/edit
  def edit
  end

  # POST /haves
  # POST /haves.json
  def create
    @hafe = Have.new(hafe_params)

    respond_to do |format|
      if @hafe.save
        format.html { redirect_to @hafe, notice: 'Have was successfully created.' }
        format.json { render action: 'show', status: :created, location: @hafe }
      else
        format.html { render action: 'new' }
        format.json { render json: @hafe.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /haves/1
  # PATCH/PUT /haves/1.json
  def update
    respond_to do |format|
      if @hafe.update(hafe_params)
        format.html { redirect_to @hafe, notice: 'Have was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @hafe.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /haves/1
  # DELETE /haves/1.json
  def destroy
    @hafe.destroy
    respond_to do |format|
      format.html { redirect_to haves_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_hafe
      @hafe = Have.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def hafe_params
      params.require(:hafe).permit(:course_number, :course_name, :course_section, :trade_id)
    end
end
