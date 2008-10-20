module UserAuth
  
  module FileUploads
    
    module BioPhotos
      
      def self.save_photo(user_id, uploaded_photo)
        if uploaded_photo.valid?
          FileUtils.rm_rf(File.join(configatron.user_auth.bio_photo.path, user_id))
          s_path = File.join(configatron.user_auth.bio_photo.path, user_id, 'bio_photo')
          uploaded_photo.save_to("#{s_path}#{File.extname(uploaded_photo.file_name)}")
          if configatron.user_auth.use_image_science
            ImageScience.with_image(uploaded_photo.destination_path) do |img|
              img.thumbnail(configatron.user_auth.bio_photo.thumb_size) do |thumb|
                thumb.save "#{s_path}_thumb#{File.extname(uploaded_photo.file_name)}"
              end
            end
          end # use_image_science
        end # uploaded_photo.valid?
      end # save_photo
      
    end # BioPhotos
    
  end # FileUploads
  
end # UserAuth