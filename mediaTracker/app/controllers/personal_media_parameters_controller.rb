class PersonalMediaParametersController < ApplicationController
  before_action :set_personal_media_parameter, only: [:show, :edit, :update, :destroy]

  # GET /personal_media_parameters
  # GET /personal_media_parameters.json
  def index
    @personal_media_parameters = PersonalMediaParameter.all
  end

  # GET /personal_media_parameters/1
  # GET /personal_media_parameters/1.json
  def show
  end

  # GET /personal_media_parameters/new
  def new
    @personal_media_parameter = PersonalMediaParameter.new
  end

  # GET /personal_media_parameters/1/edit
  def edit
  end

  # POST /personal_media_parameters
  # POST /personal_media_parameters.json
  def create
    @personal_media_parameter = PersonalMediaParameter.new(personal_media_parameter_params)

    respond_to do |format|
      if @personal_media_parameter.save
        format.html { redirect_to @personal_media_parameter, notice: 'Personal media parameter was successfully created.' }
        format.json { render :show, status: :created, location: @personal_media_parameter }
      else
        format.html { render :new }
        format.json { render json: @personal_media_parameter.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /personal_media_parameters/1
  # PATCH/PUT /personal_media_parameters/1.json
  def update
    respond_to do |format|
      if @personal_media_parameter.update(personal_media_parameter_params)
        format.html { redirect_to @personal_media_parameter, notice: 'Personal media parameter was successfully updated.' }
        format.json { render :show, status: :ok, location: @personal_media_parameter }
      else
        format.html { render :edit }
        format.json { render json: @personal_media_parameter.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /personal_media_parameters/1
  # DELETE /personal_media_parameters/1.json
  def destroy
    @personal_media_parameter.destroy
    respond_to do |format|
      format.html { redirect_to personal_media_parameters_url, notice: 'Personal media parameter was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  # def retrieveUserMedia
  #   user_media = [];
  #   if current_user then
  #     userID = current_user.id
  #     user_media = PersonalMediaParameter.includes(:general_media).where(users_id: current_user.id)
  #   end
  #   return user_media
  # end
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_personal_media_parameter
      @personal_media_parameter = PersonalMediaParameter.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def personal_media_parameter_params
      params.require(:personal_media_parameter).permit(:score, :currentStatus, :favorite, :comments, :source, :replay, :users_id, :general_medias_id)
    end
end
