class UsersController < ApplicationController
	def show
	    @thisUser = User.find(params[:id])
	    @historylog = HistoryLog.where(users_id: params[:id])
	    @followers = Follower.where(users_id: params[:id])

	    @currUserFollowers = nil
	    if @thisUser.id != current_user.id
	    	@currUserFollowers = Follower.where(users_id: current_user.id)
	    end 

	    # There is a limit to how many updates or followers can be displayed in the landing page
	    @limita = @historylog.length
	    @limitb = @followers.length
	    @historylength = @historylog.length
	    if @limita > 5
	      @limita = 5
	    end
	    if @limitb>20
	      @limitb = 20
	    end
	end

end
