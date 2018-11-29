# This is the controller for history logs
#
# Author: Alyssa Langhals (updating methods)
# Created on: 11/19

class FollowersController < ApplicationController
  before_action :set_follower, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  # GET /followers
  # GET /followers.json
  def index
    #TODO get list of followers
    @followers = current_user.followers
  end

  # GET /followers/1
  # GET /followers/1.json
  def show
    #TODO redirect to their homepage
  end

  # GET /followers/new
  def new
    @follower = Follower.new
  end


  # POST /followers
  # POST /followers.json
  def create
    @follower = Follower.new(users_id: current_user.id, user: current_user.id, fTarget: params['fTarget'].to_i)
    @thisUser = User.find_by(id: params['fTarget'].to_i)
    respond_to do |format|
      if @follower.save
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
      puts "JFJFJF"
      puts params['fTarget']
      params.require(:fTarget)#TODO permit
    end

  
end
