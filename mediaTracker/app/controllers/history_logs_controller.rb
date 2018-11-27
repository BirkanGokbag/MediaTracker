class HistoryLogsController < ApplicationController
  before_action :set_history_log, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  # GET /history_logs
  # GET /history_logs.json
  def index
    @user = User.find(current_user.id)
    @history_logs = @user.history_logs
  end

  # GET /history_logs/1
  # GET /history_logs/1.json
  def show
  end

  # GET /history_logs/new
  def new
    @history_log = current_user.history_logs.build
  end


  # POST /history_logs
  # POST /history_logs.json
  def create
    @history_log = HistoryLog.new(historyMessage: history_log_params['historyMessage'], users_id: current_user.id)
    
    respond_to do |format|
      if @history_log.save
        format.html { redirect_to @history_log, notice: 'History log was successfully created.' }
        format.json { render :show, status: :created, location: @history_log }
      else
        format.html { render :new }
        format.json { render json: @history_log.errors, status: :unprocessable_entity }
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
      params.require(:history_log).permit(:historyMessage, :users_id)
    end
end
