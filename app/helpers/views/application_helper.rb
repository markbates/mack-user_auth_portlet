module Mack
  module ViewHelpers
    module ApplicationHelper
      
      def format_date_time(dt, format = "%m/%d/%y %H:%M:%S")
        dt.strftime(format)
      end
      
      def format_date(dt, format = "%m/%d/%Y")
        dt.strftime(format)
      end
      
      def birth_years
        ((Time.now.year - 100)..(Time.now.year - 13)).to_a.reverse
      end
      
    end
  end
end
