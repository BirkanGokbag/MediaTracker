class CustomMediaController < ApplicationController
  before_action :set_custom_medium, only: [:show, :edit, :update, :destroy]

  # GET /custom_media
  # GET /custom_media.json
  def index
    @custom_media = CustomMedium.all
  end

  # GET /custom_media/1
  # GET /custom_media/1.json
  def show
  end

  # GET /custom_media/new
  def new
    @custom_medium = CustomMedium.new
  end

  # GET /custom_media/1/edit
  def edit
  end

  # POST /custom_media
  # POST /custom_media.json
  def create
    @custom_medium = CustomMedium.new(custom_medium_params)

    respond_to do |format|
      if @custom_medium.save
        format.html { redirect_to @custom_medium, notice: 'Custom medium was successfully created.' }
        format.json { render :show, status: :created, location: @custom_medium }
      else
        format.html { render :new }
        format.json { render json: @custom_medium.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /custom_media/1
  # PATCH/PUT /custom_media/1.json
  def update
    respond_to do |format|
      if @custom_medium.update(custom_medium_params)
        format.html { redirect_to @custom_medium, notice: 'Custom medium was successfully updated.' }
        format.json { render :show, status: :ok, location: @custom_medium }
      else
        format.html { render :edit }
        format.json { render json: @custom_medium.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /custom_media/1
  # DELETE /custom_media/1.json
  def destroy
    @custom_medium.destroy
    respond_to do |format|
      format.html { redirect_to custom_media_url, notice: 'Custom medium was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_custom_medium
      @custom_medium = CustomMedium.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def custom_medium_params
      params.require(:custom_medium).permit(:type, :general_medias_id)
    end
end
