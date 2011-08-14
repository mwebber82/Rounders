class ShowsController < ApplicationController

  before_filter :find_all_next_shows
  before_filter :find_page

  def index
    # you can use meta fields from your model instead (e.g. browser_title)
    # by swapping @page for @show in the line below:
    present(@page)
  end

  def show
    @show = Show.find(params[:id])

    # you can use meta fields from your model instead (e.g. browser_title)
    # by swapping @page for @show in the line below:
    present(@page)
  end

protected


  def find_all_shows
    @shows = Show.order('position ASC')
  end

  def find_page
    @page = Page.where(:link_url => "/shows").first
  end

  def find_all_next_shows
    tempshows = Show.order('Date ASC')
    @shows = []

    tempshows.each do |show|
      if show.Date >= Date.today and @show == nil
        @shows.push(show)
      end
    end
  end
end
