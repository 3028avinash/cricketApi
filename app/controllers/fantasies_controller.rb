class FantasiesController < ApplicationController
  before_action :set_fantasy, only: %i[ show edit update destroy ]

  # GET /fantasies or /fantasies.json
  def index
    @fantasies = Fantasy.all
  end

  # GET /fantasies/1 or /fantasies/1.json
  def show
  end

  # GET /fantasies/new
  def new
    @fantasy = Fantasy.new
  end

  # GET /fantasies/1/edit
  def edit
  end

  # POST /fantasies or /fantasies.json
  def create
    @fantasy = Fantasy.new(fantasy_params)

    respond_to do |format|
      if @fantasy.save
        format.html { redirect_to fantasy_url(@fantasy), notice: "Fantasy was successfully created." }
        format.json { render :show, status: :created, location: @fantasy }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @fantasy.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /fantasies/1 or /fantasies/1.json
  def update
    respond_to do |format|
      if @fantasy.update(fantasy_params)
        format.html { redirect_to fantasy_url(@fantasy), notice: "Fantasy was successfully updated." }
        format.json { render :show, status: :ok, location: @fantasy }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @fantasy.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /fantasies/1 or /fantasies/1.json
  def destroy
    @fantasy.destroy

    respond_to do |format|
      format.html { redirect_to fantasies_url, notice: "Fantasy was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_fantasy
      @fantasy = Fantasy.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def fantasy_params
      params.require(:fantasy).permit(:title, :logo, :link, :refrelCode, :signUpBonus, :Withdraw, :withdrawType)
    end
end
