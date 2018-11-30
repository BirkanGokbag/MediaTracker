# This is the controller for history logs
#
# Author: Alyssa Langhals (updating methods)
# Created on: 11/19

#Summary: Followers controller adds or deletes a follower from the table depending on if the user decides
# to follow or unfollow someone. 
class FollowersController < ApplicationController
  before_action :set_follower, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!


  # POST /followers
  # POST /followers.json
  def create
    @follower = Follower.new(users_id: current_user.id, user: current_user.id, fTarget: params['fTarget'].to_i)
    @thisUser = User.find_by(id: params['fTarget'].to_i)
    respond_to do |format|
      if @follower.save
        puts "Saved"
        format.html { redirect_to(@thisUser, :notice=> 'User was successfully followed.') }
        format.json { head :no_content, status: :created, location: @follower }
      else
        format.html { redirect_to(@thisUser, :notice=> 'User was not followed.') }
        format.json { render json: @follower.errors, status: :unprocessable_entity }
      end
    end
  end


  # DELETE /followers/1
  # DELETE /followers/1.json
  def destroy
    @follower.destroy
    @thisUser = User.find_by(id: params['fTarget'].to_i)
    respond_to do |format|
      format.html {redirect_to(@thisUser, :notice=> 'User was successfully unfollowed.') }
      format.json { head :no_content }
    end
  end

  private

      # Use callbacks to share common setup or constraints between actions.
    def set_follower
      @follower = Follower.find_by(user: current_user.id, fTarget: follower_params)
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def follower_params
      params.require(:fTarget)
    end


end
