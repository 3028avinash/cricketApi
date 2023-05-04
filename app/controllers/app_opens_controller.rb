class AppOpensController < ApplicationController
  before_action :set_app_open, only: %i[ show edit update destroy ]

  # GET /app_opens or /app_opens.json
  def index
    @app_opens = AppOpen.all
  end

  # GET /app_opens/1 or /app_opens/1.json
  def show
  end

  # GET /app_opens/new
  def new
    @app_open = AppOpen.new
  end

  # GET /app_opens/1/edit
  def edit
  end

  # POST /app_opens or /app_opens.json
  def create
    @app_open = AppOpen.new(app_open_params)

    respond_to do |format|
      if @app_open.save
        format.html { redirect_to app_open_url(@app_open), notice: "App open was successfully created." }
        format.json { render :show, status: :created, location: @app_open }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @app_open.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /app_opens/1 or /app_opens/1.json
  def update
    respond_to do |format|
      if @app_open.update(app_open_params)
        format.html { redirect_to app_open_url(@app_open), notice: "App open was successfully updated." }
        format.json { render :show, status: :ok, location: @app_open }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @app_open.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /app_opens/1 or /app_opens/1.json
  def destroy
    @app_open.destroy

    respond_to do |format|
      format.html { redirect_to app_opens_url, notice: "App open was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_app_open
      @app_open = AppOpen.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def app_open_params
      params.require(:app_open).permit(:user_id, :versionName, :versionCode, :location, :source_ip)
    end
end
