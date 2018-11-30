class StaticPagesController < ApplicationController
  layout 'application.html.erb'
  skip_before_action :verify_authenticity_token
  before_action :authenticate_user!

  def home
    #@preferences = nil
    # Get the users preferences if they are set o/w default
    #if user_signed_in?
    #  @preferences = Preference.find_by users_id: current_user.id
    #end
    #if @preferences == nil
    #  @preferences = Preference.find_by id: 1
    #end

    # Set up the title of the landing page and retrieve the tables
    @Title = "Media Tracker"
    @historylog = HistoryLog.all
    @followers = Follower.where(:users_id => current_user.id)
    #@followers = @followers.each
    @user = User.all
    @currentUserId = current_user.id

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
          redirect_to "/static_pages/addMedia"
        end
      else
        if @userParameters.save
          flash[:success] = "Successfully added the custom media!"
          redirect_to "/static_pages/home"
        else
          flash[:error] = "Oops, your custom media preferences was not added. Please try again."
          redirect_to "/static_pages/addMedia"
        end
    end

    # protect_from_forgery prepend: true


  end

  def preference_form
    @preferences = Preference.find_by users_id: current_user.id
    if @preferences == nil
      @preferences = Preference.new(:wallpaper => params[:wallpaper], :fontSize => params[:fontSize], :font => params[:font], :profilePicture => params[:profilePicture], :privacy => params[:privacy], :fontColor => params[:fontColor], :users_id => current_user[:id])
    else
      @preferences.wallpaper = params[:wallpaper];
      @preferences.fontSize = params[:fontSize];
      @preferences.font = params[:font];
      @preferences.profilePicture = params[:profilePicture];
      @preferences.privacy = params[:privacy];
      @preferences.fontColor = params[:fontColor];
    end

    if @preferences.save
      uploaded_io = params[:wallpaper]

      fileLocation = Rails.root.join('public', 'uploads', uploaded_io.original_filename)
      cssLocation = Rails.root + "app/assets/stylesheets/application.css";
      # File.open(location, 'wb') do |file|
        # file.write(uploaded_io.read)
      File.open(cssLocation,'w') do |cssFile|
        cssFile.puts "body { background-image: url(\"" + fileLocation.basename.to_s + "\";}"
      end
      # end
      Logger.new("#{Rails.root}/log/cache_read.log").error(Rails.root + "app/assets/stylesheets/application.css")
      # File.open(Rails.root + "app/assets/stylesheets/application.css",'w') do |cssFile|
      #   cssFile.puts "body { " + params[:wallpaper] + "}"
      # end
      flash[:success] = "Successfully updated your preferences."
    else
      flash[:error] = "Could not update your preferences, please try again."
    end
    redirect_to "/static_pages/home"
  end

  def search_form
    @searched_user = User.find_by username: params[:userName]
    if @searched_user == nil
      flash[:error] = "Your book was not found"
      redirect_to "/static_pages/home"
    else
      redirect_to "/users/#{@searched_user.id}"
    end
  end
  def follow
    redirect_to "/users/1"

  end


end
