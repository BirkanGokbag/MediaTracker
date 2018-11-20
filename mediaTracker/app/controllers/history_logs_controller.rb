class HistoryLogsController < ApplicationController
  before_action :set_history_log, only: [:show, :edit, :update, :destroy]

  # GET /history_logs
  # GET /history_logs.json
  def index
    @history_logs = HistoryLog.all
  end

  # GET /history_logs/1
  # GET /history_logs/1.json
  def show
  end

  # GET /history_logs/new
  def new
    @history_log = HistoryLog.new
  end

  # GET /history_logs/1/edit
  def edit
  end

  # POST /history_logs
  # POST /history_logs.json
  def create
    @history_log = HistoryLog.new(history_log_params)

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

  # PATCH/PUT /history_logs/1
  # PATCH/PUT /history_logs/1.json
  def update
    respond_to do |format|
      if @history_log.update(history_log_params)
        format.html { redirect_to @history_log, notice: 'History log was successfully updated.' }
        format.json { render :show, status: :ok, location: @history_log }
      else
        format.html { render :edit }
        format.json { render json: @history_log.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /history_logs/1
  # DELETE /history_logs/1.json
  def destroy
    @history_log.destroy
    respond_to do |format|
      format.html { redirect_to history_logs_url, notice: 'History log was successfully destroyed.' }
      format.json { head :no_content }
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
