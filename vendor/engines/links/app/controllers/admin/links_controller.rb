module Admin
  class LinksController < Admin::BaseController

    crudify :link,
            :title_attribute => 'Title', :xhr_paging => true

  end
end
