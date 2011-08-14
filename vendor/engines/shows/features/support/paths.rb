module NavigationHelpers
  module Refinery
    module Shows
      def path_to(page_name)
        case page_name
        when /the list of shows/
          admin_shows_path

         when /the new show form/
          new_admin_show_path
        else
          nil
        end
      end
    end
  end
end
