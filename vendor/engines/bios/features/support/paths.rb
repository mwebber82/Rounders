module NavigationHelpers
  module Refinery
    module Bios
      def path_to(page_name)
        case page_name
        when /the list of bios/
          admin_bios_path

         when /the new bio form/
          new_admin_bio_path
        else
          nil
        end
      end
    end
  end
end
