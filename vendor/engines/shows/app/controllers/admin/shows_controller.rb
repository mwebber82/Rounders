module Admin
  class ShowsController < Admin::BaseController

    crudify :show,
            :title_attribute => 'Title', :xhr_paging => true

  end
end
