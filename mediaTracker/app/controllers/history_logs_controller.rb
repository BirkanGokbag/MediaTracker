# This is the controller for history logs
#
# Author: Alyssa Langhals (updating methods)
# Created on: 11/25

#Summary: This controller handles the history functioanlity.
#This includes providing the history for the home page and the user's history.
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
  def create(verb)
    if params['name']
      message = verb + params['name']
    else
      message = verb + GeneralMedium.find_by(id: params['deleteId'].to_i).name
    end
    message += " at "
    @history_log = HistoryLog.new(historyMessage: message, users_id: current_user.id)

    respond_to do |format|
      if @history_log.save
        format.html {head :no_content}
        format.json {head :no_content}
      else
        format.html {head :internal_server_error}
        format.json {head :internal_server_error}
      end

    end
  end



  private
    # Use callbacks to share common setup or constraints between actions.
    def set_history_log
      @history_log = HistoryLog.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def history_log_params
    end
end
