class TaskOffersController < ApplicationController
  before_action :set_task_offer, only: %i[ show edit update destroy ]
  before_action :set_point_reward, only: %i[ update edit ]

  # GET /task_offers or /task_offers.json
  def index
    @task_offers = TaskOffer.all
  end

  # GET /task_offers/1 or /task_offers/1.json
  def show
  end

  # GET /task_offers/new
  def new
    @task_offer = TaskOffer.new
    @task_offer.point = rand(25..60)
    @task_offer.reward = @task_offer.point.to_f/10 
    @task_offer.steps = " "
    @task_offer.termsCondition = " "
    @task_offer.link = " "
  end

  # GET /task_offers/1/edit
  def edit
    @task_offer.reward = @task_offer.point.to_f/10
  end

  # POST /task_offers or /task_offers.json
  def create
    @task_offer = TaskOffer.new(task_offer_params)

    respond_to do |format|
      if @task_offer.save
        format.html { redirect_to task_offer_url(@task_offer), notice: "Task offer was successfully created." }
        format.json { render :show, status: :created, location: @task_offer }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @task_offer.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /task_offers/1 or /task_offers/1.json
  def update
    respond_to do |format|
      if @task_offer.update(task_offer_params)
        format.html { redirect_to task_offer_url(@task_offer), notice: "Task offer was successfully updated." }
        format.json { render :show, status: :ok, location: @task_offer }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @task_offer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /task_offers/1 or /task_offers/1.json
  def destroy
    @task_offer.destroy

    respond_to do |format|
      format.html { redirect_to task_offers_url, notice: "Task offer was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_task_offer
      @task_offer = TaskOffer.find(params[:id])
    end
    def set_point_reward
      @task_offer.point = rand(25..60)
      @task_offer.reward = rand(5..25)
    end

    # Only allow a list of trusted parameters through.
    def task_offer_params
      params.require(:task_offer).permit({tasks: []},:title,:titleImg, :point, :reward, :termsCondition, :steps, :link)
    end
end
