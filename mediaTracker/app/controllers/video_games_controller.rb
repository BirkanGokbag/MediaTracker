#Auto-generated by rails
#Modified by Rajeev Ravi 11/28 + 11/29- Updated the index method to retrieve the users video game media.

#Summary: This controller handles the video game media for the site. The main functionality of this controller
# is in the index method which is primarily used to filter out the media that belongs to the user.
class VideoGamesController < ApplicationController
  before_action :set_video_game, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  #Accesses the user's video games. Author:Rajeev Ravi
  def index
    @video_games = (GeneralMedium.joins(:video_game)).joins(:personal_media_parameters).where('personal_media_parameters.users_id =?', current_user.id)
  end

  # GET /video_games/new
  def new
    @video_game = VideoGame.new
  end

  # GET /video_games/1/edit
  def edit
  end

  # POST /video_games
  # POST /video_games.json
  def create
    @video_game = VideoGame.new(video_game_params)

    respond_to do |format|
      if @video_game.save
        format.html { redirect_to @video_game, notice: 'Video game was successfully created.' }
        format.json { render :show, status: :created, location: @video_game }
      else
        format.html { render :new }
        format.json { render json: @video_game.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /video_games/1
  # PATCH/PUT /video_games/1.json
  def update
    respond_to do |format|
      if @video_game.update(video_game_params)
        format.html { redirect_to @video_game, notice: 'Video game was successfully updated.' }
        format.json { render :show, status: :ok, location: @video_game }
      else
        format.html { render :edit }
        format.json { render json: @video_game.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /video_games/1
  # DELETE /video_games/1.json
  def destroy
    @video_game.destroy
    respond_to do |format|
      format.html { redirect_to video_games_url, notice: 'Video game was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_video_game
      @video_game = VideoGame.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def video_game_params
      params.require(:video_game).permit(:studio, :system, :general_medias_id)
    end
end
