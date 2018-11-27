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
    logger = Logger.new("#{Rails.root}/log/cache_read.log")
    logger.error(params)
    # protect_from_forgery prepend: true
    redirect_to "/static_pages/addMedia"
  end
end
