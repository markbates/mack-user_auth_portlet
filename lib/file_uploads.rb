module UserAuth
  
  module FileUploads
    
    module BioPhotos
      
      def self.save_photo(user_id, uploaded_photo)
        if uploaded_photo.valid?
          FileUtils.rm_rf(File.join(configatron.user_auth.bio_photo.path, user_id))
          uploaded_photo.save_to(configatron.user_auth.bio_photo.path, user_id, "bio_photo#{File.extname(uploaded_photo.file_name)}")
        end
      end
      
    end
    
  end
  
end