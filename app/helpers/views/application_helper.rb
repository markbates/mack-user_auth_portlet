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
      
      def user_bio_photo(id, options = {})
        path = File.join(configatron.user_auth.bio_photo.path, id, 'bio_photo.*')
        imgs = Dir.glob(path).sort
        if imgs.empty?
          img('not_available.gif', options)
        else
          img(imgs.first.gsub(Mack::Paths.public, ''), options)
        end
      end
      
    end
  end
end
