module NavigationHelpers
  module Refinery
    module Widgets
      def path_to(page_name)
        case page_name
        when /the list of widgets/
          admin_widgets_path

         when /the new widget form/
          new_admin_widget_path
        else
          nil
        end
      end
    end
  end
end
