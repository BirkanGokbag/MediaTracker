class GeneralMediaController < ApplicationController
  before_action :set_general_medium, only: [:show, :edit, :update, :destroy]

  # GET /general_media
  # GET /general_media.json
  def index
    @general_media = GeneralMedium.all
  end


  # GET /general_media/new
  def new
    @general_medium = GeneralMedium.new
  end


  # POST /general_media
  # POST /general_media.json
  def create
    @general_medium = GeneralMedium.new(general_medium_params)
  
    respond_to do |format|
      if @general_medium.save
        format.html { redirect_to @general_medium, notice: 'General medium was successfully created.' }
        format.json { render :show, status: :created, location: @general_medium }
      else
        format.html { render :new }
        format.json { render json: @general_medium.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /general_media/1
  # PATCH/PUT /general_media/1.json
  def update
    respond_to do |format|
      if @general_medium.update(general_medium_params)
        format.html { redirect_to @general_medium, notice: 'General medium was successfully updated.' }
        format.json { render :show, status: :ok, location: @general_medium }
      else
        format.html { render :edit }
        format.json { render json: @general_medium.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /general_media/1
  # DELETE /general_media/1.json
  def destroy
    @general_medium.destroy
    respond_to do |format|
      format.html { redirect_to general_media_url, notice: 'General medium was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_general_medium
      @general_medium = GeneralMedium.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def general_medium_params
      params.require(:general_medium).permit(:name)
    end
end
