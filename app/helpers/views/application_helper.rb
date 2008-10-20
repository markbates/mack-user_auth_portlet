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
      
      def user_bio_photo_path(id, type = nil)
        name = 'bio_photo'
        name << "_#{type}" if type
        name << '.*'
        path = File.join(configatron.user_auth.bio_photo.path, id, name)
        imgs = Dir.glob(path).sort
        if imgs.empty?
          '/images/not_available.gif'
        else
          imgs.first.gsub(Mack::Paths.public, '')
        end
      end
      
    end
  end
end
