class StaticPagesController < ApplicationController
  layout 'application.html.erb'
  skip_before_action :verify_authenticity_token
  @@info

  def home

    # Set up the title of the landing page and retrieve the table
    @Title = "Media Tracker"
    @historylog = HistoryLog.all

    # There is a limit to how many updates can be displayed in the landing page
    @limit = @historylog.length
    @historylength = @historylog.length
    if @limit > 5
      @limit = 5
    end
  end

  def faq
  end

  def tv_form
    # Add the keys to tv, user, and general media table
    logger = Logger.new("#{Rails.root}/log/cache_read.log")
    # # logger.error(params)
    # @general = GeneralMedium.new(:name => params[:name])
    # #
    # @general.save
    # logger.error(@general.errors)
    # #
    # @special = TvShow.new(:numberOfSeasons => params[:numberOfSeasons][:temp], :totalEpisodes => params[:totalEpisodes][:temp], :general_media_id => @general[:id])
    # #
    # @special.save
    # logger.error(@special.errors)
    # #
    # @userParameters = PersonalMediaParameter.new(:score => params[:score][:temp], :currentStatus => params[:currentStatus], :favorite => params[:favorite], :comments => params[:comments], :source => params[:source], :replay => params[:replay][:temp], :users_id => User.find_by(id: session[:users_id]), :general_media_id => @general[:id])
    # #
    # @userParameters.save
    # logger.error(@userParameters.errors)
    logger.error(session[:users_id])

    # if (params[:commit] == "Submit TV Media")
    # end






    # @special[:general_media_id] = @general[:id]

    # @userParameters[:users_id] = User.find_by(id: session[:users_id])
    # @userParameters[:general_media_id] = @general[:id]


    # if @userParameters.save && @special.save && @general.save
      # redirect_to "/static_pages/addMedia"
    # else
      redirect_to "/static_pages/home"
    # end

    # protect_from_forgery prepend: true

  end
end
