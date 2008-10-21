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
      
      def pagination_links(total_pages, url, options = {}, &block)
        options = {:next => 'next >>', :prev => '<< prev'}.merge(options)
        cur_page = (params[:page] || 1).to_i
        links = []
        if cur_page > 1 && options[:prev]
          links << link_unless_current(options[:prev], send(url, :page => cur_page - 1))
        end
        if block_given?
          total_pages.times do |i|
            page = i + 1
            yield page, cur_page
          end          
        else
          total_pages.times do |i|
            page = i + 1
            opts = {}
            opts[:page] = page unless page == 1
            links << link_unless_current(page, send(url, opts))
          end
        end
        if cur_page < total_pages
          if cur_page > 1 && options[:next]
            links << link_unless_current(options[:next], send(url, :page => cur_page + 1))
          end
        end
        links.join(' ')
      end
      
    end
  end
end
