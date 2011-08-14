module Admin
  class BiosController < Admin::BaseController

    crudify :bio,
            :title_attribute => 'Name', :xhr_paging => true

  end
end
