class StaticPagesController < ApplicationController
  layout 'application.html.erb'
  skip_before_action :verify_authenticity_token
  before_action :authenticate_user!

  def home
    @Title = "Media Tracker"
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

    if customSpecific == 0
        @userParameters = PersonalMediaParameter.new(:score => params[:score][:temp], :currentStatus => params[:currentStatus], :favorite => params[:favorite], :comments => params[:comments], :source => params[:source], :replay => params[:replay][:temp], :users_id => current_user[:id], :general_media_id => @general[:id])
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
        flash[:success] = "Successfully added the media!"
        redirect_to "/static_pages/home"
    end

    # protect_from_forgery prepend: true

  end
end
