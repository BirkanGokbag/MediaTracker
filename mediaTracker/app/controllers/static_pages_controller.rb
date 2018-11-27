class StaticPagesController < ApplicationController
  layout 'application.html.erb'
  skip_before_action :verify_authenticity_token
  @@info

  def home
    @Title = "Media Tracker"
  end

  def faq
  end

  def tv_form
    # Add the keys to tv, user, and general media table
    # logger = Logger.new("#{Rails.root}/log/cache_read.log")
    # logger.error(params)
    @userParameters = PersonalMediaParameter.new(:score => params[:score], :currentStatus => params[:currentStatus], :favorite => params[:favorite], :comments => params[:comments], :source => params[:source], :replay => params[:replay])
    @general = GeneralMedium.new(:name => params[:name])

    if (params[:commit] == "Submit TV Media")
      @special = TvShow.new(:numberOfSeasons => params[:numberOfSeasons], :totalEpisodes => params[:totalEpisodes])
    end
    @general[:specific_medias_id] = @special[:id]
    @userParameters[:users_id] = User.find_by(id: session[:users_id])
    @userParameters[:general_medias_id] = @general[:id]

    # protect_from_forgery prepend: true
    redirect_to "/static_pages/addMedia"
  end
end
