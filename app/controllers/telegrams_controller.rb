class TelegramsController < ApplicationController
  before_action :set_telegram, only: %i[ show edit update destroy ]

  # GET /telegrams or /telegrams.json
  def index
    @telegrams = Telegram.all
  end

  # GET /telegrams/1 or /telegrams/1.json
  def show
  end

  # GET /telegrams/new
  def new
    @telegram = Telegram.new
  end

  # GET /telegrams/1/edit
  def edit
  end

  # POST /telegrams or /telegrams.json
  def create
    @telegram = Telegram.new(telegram_params)

    respond_to do |format|
      if @telegram.save
        format.html { redirect_to telegram_url(@telegram), notice: "Telegram was successfully created." }
        format.json { render :show, status: :created, location: @telegram }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @telegram.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /telegrams/1 or /telegrams/1.json
  def update
    respond_to do |format|
      if @telegram.update(telegram_params)
        format.html { redirect_to telegram_url(@telegram), notice: "Telegram was successfully updated." }
        format.json { render :show, status: :ok, location: @telegram }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @telegram.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /telegrams/1 or /telegrams/1.json
  def destroy
    @telegram.destroy

    respond_to do |format|
      format.html { redirect_to telegrams_url, notice: "Telegram was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_telegram
      @telegram = Telegram.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def telegram_params
      params.require(:telegram).permit(:name, :description, :url, :avatar, :cover)
    end
end
