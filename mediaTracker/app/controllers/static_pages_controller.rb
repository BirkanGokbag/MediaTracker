class StaticPagesController < ApplicationController
  layout 'application.html.erb'

  def home
    @Title = "Media Tracker"
  end

  def faq
  end
end
