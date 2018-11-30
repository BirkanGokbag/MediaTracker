class StaticPagesController < ApplicationController
  layout 'application.html.erb'
  skip_before_action :verify_authenticity_token
  before_action :authenticate_user!

  #
  # Author: Berkay Kaplan
  # Pulls the models to retrieve the followers of the current user and the latest updates in the public page
  #
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

  #
  # Author: Birkan Gokbag
  # Add the entered information into the tables specified by the user
  #
  def form
    # Add the keys to tv, user, and general media table
    # Use the logger for error printing: Logger.new("#{Rails.root}/log/cache_read.log")

    # customSpecific determines whether the form belongs to custom media
    customSpecific = 0

    #customSpecific determines whether media is saved under a speicific media table or custom table
    if params[:commit] == "Submit Custom Media"

      duplicateCustomTable = CustomMedium.where(typeOfMedia: params[:typeOfMedia])
      if duplicateCustomTable.any?
        flash[:error] = "You already have added a custom media entry with that name, either delete the previous one or enter a new one."
        redirect_to "/static_pages/addMedia"
        customSpecific = 2
      end

    end

    if customSpecific != 2
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
    end


  end

  #
  # Author: Birkan Gokbag & Michael Radey
  # Used in order to record the preferences of the user. IN PROGRESS
  #
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


  def edit

    # params[:mediaId] contains the media id of the general media.
    @userParam = PersonalMediaParameter.find_by(general_media_id: params[:editId])
    Logger.new("#{Rails.root}/log/cache_read.log").error(params[:editId])

    @userParam[:score] = params[:score][:temp]
    @userParam[:currentStatus] = params[:currentStatus]
    @userParam[:favorite] = params[:favorite]
    @userParam[:comments] = params[:comments]
    @userParam[:source] = params[:source]
    @userParam[:replay] = params[:replay][:temp]

    @generalMedia = GeneralMedium.find_by(id: params[:editId])
    @generalMedia[:name] = params[:name]

    # params[:commit] contains the submit information to a specific media
    case params[:commit]
      when "Submit Video Game Media"
        @special = VideoGame.find_by(general_media_id: params[:editId])
        @special[:system] = params[:system]
        @special[:studio] = params[:studio]
      when "Submit Book Media"
        @special = Book.find_by(general_media_id: params[:editId])
        @special[:author] = params[:author]
      when "Submit TV Media"
        @special = TvShow.find_by(general_media_id: params[:editId])
        @special[:numberOfSeasons] = params[:numberOfSeasons][:temp]
        @special[:totalEpisodes] = params[:totalEpisodes][:temp]
      when "Submit Music Media"
        @special = Music.find_by(general_media_id: params[:editId])
        @special[:artist] = params[:artist]
        @special[:album] = params[:album]
      when "Submit Movie Media"
        @special = Movie.find_by(general_media_id: params[:editId])
        @special[:director] = params[:director]
      when "Submit Magazine Media"
        @special = Magazine.find_by(general_media_id: params[:editId])
        @special[:issue] = params[:issue][:temp]
      else
        # For custom submission

    end

      if @userParam.save && @generalMedia.save && @special.save
        flash[:success] = "Successfully updated the media!"
        redirect_to "/static_pages/home"
      else
        # if it wasn't registered correctly, redirect them to home page.
        flash[:error] = "Oops, your media was not updated. Please try again."
        redirect_to "/static_pages/addMedia"
      end

  end

  def delete

    # params[:mediaId] contains the media id of the general media.
    @userParam = PersonalMediaParameter.find_by(general_media_id: params[:editId])
    @generalMedia = GeneralMedium.find_by(id: params[:editId])

    # params[:commit] contains the submit information to a specific media
    case params[:commit]
      when "Submit Video Game Media"
        @special = VideoGame.find_by(general_media_id: params[:editId])
      when "Submit Book Media"
        @special = Book.find_by(general_media_id: params[:editId])
      when "Submit TV Media"
        @special = TvShow.find_by(general_media_id: params[:editId])
      when "Submit Music Media"
        @special = Music.find_by(general_media_id: params[:editId])
      when "Submit Movie Media"
        @special = Movie.find_by(general_media_id: params[:editId])
      when "Submit Magazine Media"
        @special = Magazine.find_by(general_media_id: params[:editId])
      else
        # For custom submission

    end

    if @userParam.destroy && @generalMedia.destroy && @special.destroy
      flash[:success] = "Successfully deleted the media!"
      redirect_to "/static_pages/home"
    else
      # if it wasn't registered correctly, redirect them to home page.
      flash[:error] = "Oops, your media was not deleted. Please try again."
      redirect_to "/static_pages/addMedia"
    end

  end

  def follow
    redirect_to "/users/1"

  end


end
