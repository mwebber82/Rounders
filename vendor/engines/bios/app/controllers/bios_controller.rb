class BiosController < ApplicationController

  before_filter :find_all_bios
  before_filter :find_page

  def index
    # you can use meta fields from your model instead (e.g. browser_title)
    # by swapping @page for @bio in the line below:
    present(@page)
  end

  def show
    @bio = Bio.find(params[:id])

    # you can use meta fields from your model instead (e.g. browser_title)
    # by swapping @page for @bio in the line below:
    present(@page)
  end

protected

  def find_all_bios
    @bios = Bio.order('position ASC')
  end

  def find_page
    @page = Page.where(:link_url => "/bios").first
  end

end
