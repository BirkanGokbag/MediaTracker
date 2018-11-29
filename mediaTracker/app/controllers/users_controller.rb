class UsersController < ApplicationController
	def show
		@thisUser = User.find(params[:id])
	    @historylog = HistoryLog.all
	    @followers = Follower.all
	    @user = User.all

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
