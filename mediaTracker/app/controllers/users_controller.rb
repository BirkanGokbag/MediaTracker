
#Auto-generated by rails

#Summary: 

#
# Author: Michael Radey
#
# Pulls the models to retrieve the latest updates to history logs for the 
# current user.  Also gets all the people that this user follows.  If the 
# user of this page is not current user, get all of the current user's followers
# as well to determine if this user is someone the current user follows.
#
class UsersController < ApplicationController

    
	def show
	    @thisUser = User.find(params[:id])
	    @historyLogs = HistoryLog.where(users_id: params[:id]).last(10)
	    @followers = Follower.where(users_id: params[:id])

	    @privateAccount = Preference.find_by(users_id: params[:id])
	    if @privateAccount != nil
	    	@privateAccount = @privateAccount.privacy
	    end 
	    @currUserFollowers = nil
	    if @thisUser.id != current_user.id
	    	@currUserFollowers = Follower.where(users_id: current_user.id)

	    	#Get all of the users media to display to visitor 
			@books = (GeneralMedium.joins(:book)).joins(:personal_media_parameters).where('personal_media_parameters.users_id =?', @thisUser.id)
			@movies = (GeneralMedium.joins(:movie)).joins(:personal_media_parameters).where('personal_media_parameters.users_id =?', @thisUser.id)
			@musics = (GeneralMedium.joins(:music)).joins(:personal_media_parameters).where('personal_media_parameters.users_id =?', @thisUser.id)
			@tv_shows = (GeneralMedium.joins(:tv_show)).joins(:personal_media_parameters).where('personal_media_parameters.users_id =?', @thisUser.id)
			@video_games = (GeneralMedium.joins(:video_game)).joins(:personal_media_parameters).where('personal_media_parameters.users_id =?', @thisUser.id)
			@custom_media = ((GeneralMedium.joins(:personal_media_parameters).where('personal_media_parameters.users_id =?', @thisUser.id)).joins(:custom_medium))
	    end


	end

end
