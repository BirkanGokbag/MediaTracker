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
    logger = Logger.new("#{Rails.root}/log/cache_read.log")
    k = 0;
    logger.error(params)
    @general = GeneralMedium.new(:name => params[:name])
    # Need to save the general media before creating the other ones as the id is required
    @general.save
    @userParameters = PersonalMediaParameter.new(:score => params[:score][:temp], :currentStatus => params[:currentStatus], :favorite => params[:favorite], :comments => params[:comments], :source => params[:source], :replay => params[:replay][:temp], :users_id => current_user[:id], :general_media_id => @general[:id])
    @special
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
        k = 1;
        # For custom submission
        @customMedia = CustomMedium.new(:type => params[:type], :general_media_id => @general[:id])
        @customMedia.save

        # Now Create the amount of entries the user has entered.

        @customMediaEntry
        (1..params[:allFields]).each do |i|
          key = ":" + (i + 0.1).to_s
          value = ":" + (i + 0.2).to_s
          @customMediaEntry = CustomMediaEntry.new(:custom_medium_id => @customMedia[:id], :key => params[key],:value =>params[value])
          @customMediaEntry.save
        end

    end

    case k
      when 0
        # This is for the regular media
        if @userParameters.save && @special.save
          flash[:success] = "Successfully added the media!"
          redirect_to "/static_pages/home"
        else
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
