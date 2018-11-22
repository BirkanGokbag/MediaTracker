class CustomMediaEntriesController < ApplicationController
  before_action :set_custom_media_entry, only: [:show, :edit, :update, :destroy]

  # GET /custom_media_entries
  # GET /custom_media_entries.json
  def index
    @custom_media_entries = CustomMediaEntry.all
  end

  # GET /custom_media_entries/1
  # GET /custom_media_entries/1.json
  def show
  end

  # GET /custom_media_entries/new
  def new
    @custom_media_entry = CustomMediaEntry.new
  end

  # GET /custom_media_entries/1/edit
  def edit
  end

  # POST /custom_media_entries
  # POST /custom_media_entries.json
  def create
    @custom_media_entry = CustomMediaEntry.new(custom_media_entry_params)

    respond_to do |format|
      if @custom_media_entry.save
        format.html { redirect_to @custom_media_entry, notice: 'Custom media entry was successfully created.' }
        format.json { render :show, status: :created, location: @custom_media_entry }
      else
        format.html { render :new }
        format.json { render json: @custom_media_entry.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /custom_media_entries/1
  # PATCH/PUT /custom_media_entries/1.json
  def update
    respond_to do |format|
      if @custom_media_entry.update(custom_media_entry_params)
        format.html { redirect_to @custom_media_entry, notice: 'Custom media entry was successfully updated.' }
        format.json { render :show, status: :ok, location: @custom_media_entry }
      else
        format.html { render :edit }
        format.json { render json: @custom_media_entry.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /custom_media_entries/1
  # DELETE /custom_media_entries/1.json
  def destroy
    @custom_media_entry.destroy
    respond_to do |format|
      format.html { redirect_to custom_media_entries_url, notice: 'Custom media entry was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_custom_media_entry
      @custom_media_entry = CustomMediaEntry.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def custom_media_entry_params
      params.require(:custom_media_entry).permit(:key, :value)
    end
end