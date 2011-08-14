module Admin
  class VideosController < Admin::BaseController

    crudify :video,
            :title_attribute => 'Title', :xhr_paging => true

  end
end
