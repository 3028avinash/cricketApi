class EarnsController < ApplicationController
  before_action :set_earn, only: %i[ show edit update destroy ]

  # GET /earns or /earns.json
  def index
    @earns = Earn.all
  end

  # GET /earns/1 or /earns/1.json
  def show
  end

  # GET /earns/new
  def new
    @earn = Earn.new
    @account = Account.last
    @earn.account = @account
    

  end

  # GET /earns/1/edit
  def edit
  end

  # POST /earns or /earns.json
  def create
    @earn = Earn.new(earn_params)
    # @account.coin = @account.coin
    if @earn.coin < 0
      render :new
    else
      respond_to do |format|
      if @earn.save
        format.html { redirect_to earn_url(@earn), notice: "Earn was successfully created." }
        format.json { render :show, status: :created, location: @earn }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @earn.errors, status: :unprocessable_entity }
      end
    end
    
    end
  end

  # PATCH/PUT /earns/1 or /earns/1.json
  def update
    @account = Account.last
    @account.coin = @earn.coin
      respond_to do |format|
        if @earn.update(earn_params)
          format.html { redirect_to earn_url(@earn), notice: "Earn was successfully updated." }
          format.json { render :show, status: :ok, location: @earn }
        else
          format.html { render :edit, status: :unprocessable_entity }
          format.json { render json: @earn.errors, status: :unprocessable_entity }
        end
    
    end
    
  end

  # DELETE /earns/1 or /earns/1.json
  def destroy
    @earn.destroy

    respond_to do |format|
      format.html { redirect_to earns_url, notice: "Earn was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_earn
      @earn = Earn.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def earn_params
      params.require(:earn).permit(:account_id, :logo, :type, :coin)
    end
end
