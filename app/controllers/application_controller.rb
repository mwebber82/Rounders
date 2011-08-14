class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :find_all_blog_posts, :find_next_show

  protected

  def find_all_blog_posts
    @blog_posts = BlogPost.live.includes(:comments, :categories).paginate({
      :page => params[:page],
      :per_page => RefinerySetting.find_or_set(:blog_posts_per_page, 10)
    })
  end


  def find_next_show
    tempshows = Show.order('Date ASC')
    @shows = []

    tempshows.each do |show|
      if show.Date >= Date.today and @show == nil
        @shows.push(show)
      end
    end
  end
end
