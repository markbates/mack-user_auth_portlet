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
      
      def users_pagination_links
        cur_page = (params[:page] || 1).to_i
        links = []
        if cur_page > 1
          links << link_unless_current('<< prev', users_index_url(:page => cur_page - 1))
        end
        @user_page_count.times do |i|
          page = i + 1
          options = {}
          options[:page] = page unless page == 1
          links << link_unless_current(page, users_index_url(options))
        end
        if cur_page < @user_page_count
          if cur_page > 1
            links << link_unless_current('next >>', users_index_url(:page => cur_page + 1))
          end
        end
        links.join(' ')
      end
      
    end
  end
end
