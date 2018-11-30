class StaticPagesController < ApplicationController
  layout 'application.html.erb'
  skip_before_action :verify_authenticity_token
  before_action :authenticate_user!

  #
  # Author: Berkay Kaplan
  # Pulls the models to retrieve the followers of the current user and the latest updates in the public page
  #
  def home
     # Set up the title of the landing page and retrieve the tables
    @Title = "Media Tracker"
    @historyLogs = HistoryLog.last(10).reverse - [nil]

    # There is a limit to how many updates or followers can be displayed in the landing page
    @limita = @historyLogs.length
    if @limita > 10
      @limita = 10
    end
  end

  def faq
  end

  def form
    # Add the keys to tv, user, and general media table
    # Use the logger for error printing: Logger.new("#{Rails.root}/log/cache_read.log")

    #customSpecific determines whether media is saved under a speicific media table or custom table
    customSpecific = 0;
    @general = GeneralMedium.new(:name => params[:name])
    # Need to save the general media before creating the other ones as the id is required
    @general.save

    # Get the user parameters for the media
    @userParameters = PersonalMediaParameter.new(:score => params[:score][:temp], :currentStatus => params[:currentStatus], :favorite => params[:favorite], :comments => params[:comments], :source => params[:source], :replay => params[:replay][:temp], :users_id => current_user[:id], :general_media_id => @general[:id])

    # params[:commit] contains the submit information to a specific media
    case params[:commit]
      when "Submit Video Game Media"
        @special = VideoGame.new(:studio => params[:studio], :system => params[:system], :general_media_id => @general[:id])
      when "Submit Book Media"
        @special = Book.new(:author => params[:author], :general_media_id => @general[:id])
      when "Submit TV Media"
        @special = TvShow.new(:numberOfSeasons => params[:numberOfSeasons][:temp], :totalEpisodes => params[:totalEpisodes][:temp], :general_media_id => @general[:id])
      when "Submit Music Media"
        @special = Music.new(:artist => params[:artist], :album => params[:album], :general_media_id => @general[:id])
      when "Submit Movie Media"
        @special = Movie.new(:director => params[:director], :general_media_id => @general[:id])
      when "Submit Magazine Media"
        @special = Magazine.new(:issue => params[:issue][:temp], :general_media_id => @general[:id])
      else
        customSpecific = 1;
        # For custom submission
        @customMedia = CustomMedium.new(:typeOfMedia => params[:typeOfMedia], :general_media_id => @general[:id])
        @customMedia.save

        # Now Create the amount of entries the user has entered.
        @customMediaEntry
        (1..params[:allFields].to_i).each do |i|
          # For each custom media, save them with their own respective attributes
          @customMediaEntry = CustomMediaEntry.new(:custom_media_id => @customMedia[:id], :key => params[(i + 0.1).to_s],:value =>params[(i + 0.2).to_s])
          @customMediaEntry.save
        end

    end

    #This will call the controller to create a history log    
    history_logs_cont = HistoryLogsController.new
    history_logs_cont.request = request
    history_logs_cont.response = response
    history_logs_cont.create

    if customSpecific == 0
        # This is for the regular media, save the parameters and the special media
        if @userParameters.save && @special.save
          flash[:success] = "Successfully added the media!"
          redirect_to "/static_pages/home"
        else
          # if it wasn't registered correctly, redirect them to home page.
          flash[:error] = "Oops, your media was not added. Please try again."
          redirect_to "/static_pages/static_pages/addMedia"
        end
      else
        if @userParameters.save
          flash[:success] = "Successfully added the custom media!"
          redirect_to "/static_pages/home"
        else
          flash[:error] = "Oops, your custom media preferences was not added. Please try again."
          redirect_to "/static_pages/static_pages/addMedia"
        end
    end

    # protect_from_forgery prepend: true


  end
  def preference_form
    @preferences = Preference.find_by users_id: current_user.id
    if @preferences == nil
      @preferences = Preference.find 1
    end 
    redirect_to "/static_pages/home"
  end
  def search_form
    @searched_user = User.find_by username: params[:userName]
    if @searched_user == nil
      flash[:error] = "Username not found"
      redirect_to "/static_pages/home"
    else
      redirect_to "/users/#{@searched_user.id}"
    end 
  end 



end

