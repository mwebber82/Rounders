class VideosController < ApplicationController

  before_filter :find_all_videos
  before_filter :find_page

  def index
    # you can use meta fields from your model instead (e.g. browser_title)
    # by swapping @page for @video in the line below:
    present(@page)
  end

  def show
    @video = Video.find(params[:id])

    # you can use meta fields from your model instead (e.g. browser_title)
    # by swapping @page for @video in the line below:
    present(@page)
  end

protected

  def find_all_videos
    @videos = Video.order('position ASC')
  end

  def find_page
    @page = Page.where(:link_url => "/videos").first
  end

end
