# This is the controller for history logs
#
# Author: Alyssa Langhals (updating methods)
# Created on: 11/25

class HistoryLogsController < ApplicationController
  before_action :set_history_log, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  # GET /history_logs
  # GET /history_logs.json
  def index
    @user = User.find(current_user.id)
    @history_logs = @user.history_logs
  end

  # POST /history_logs
  # POST /history_logs.json
  def create
    @history_log = HistoryLog.new(historyMessage: history_log_params['name'], users_id: current_user.id)
    
    respond_to do |format|
      if @history_log.save
        format.html {head :ok}
        format.json {head :ok}
      else
        format.html {head :internal_server_error}
        format.json {head :internal_server_error}
      end
      head :ok
    end
  end



  private
    # Use callbacks to share common setup or constraints between actions.
    def set_history_log
      @history_log = HistoryLog.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def history_log_params
      #TODO 
      params.require(:general_medium)#.permit(:historyMessage, :users_id)
    end
end
