class PlayEarnsController < ApplicationController
  before_action :set_play_earn, only: %i[ show edit update destroy ]

  # GET /play_earns or /play_earns.json
  def index
    @play_earns = PlayEarn.all
  end

  # GET /play_earns/1 or /play_earns/1.json
  def show
  end

  # GET /play_earns/new
  def new
    @play_earn = PlayEarn.new
  end

  # GET /play_earns/1/edit
  def edit
  end

  # POST /play_earns or /play_earns.json
  def create
    @play_earn = PlayEarn.new(play_earn_params)

    respond_to do |format|
      if @play_earn.save
        format.html { redirect_to play_earn_url(@play_earn), notice: "Play earn was successfully created." }
        format.json { render :show, status: :created, location: @play_earn }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @play_earn.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /play_earns/1 or /play_earns/1.json
  def update
    respond_to do |format|
      if @play_earn.update(play_earn_params)
        format.html { redirect_to play_earn_url(@play_earn), notice: "Play earn was successfully updated." }
        format.json { render :show, status: :ok, location: @play_earn }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @play_earn.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /play_earns/1 or /play_earns/1.json
  def destroy
    @play_earn.destroy

    respond_to do |format|
      format.html { redirect_to play_earns_url, notice: "Play earn was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_play_earn
      @play_earn = PlayEarn.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def play_earn_params
      params.require(:play_earn).permit(:title, :blogImage, :blogUrl)
    end
end
