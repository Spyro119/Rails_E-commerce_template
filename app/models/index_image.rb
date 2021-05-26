class IndexImage < ApplicationRecord
    
    mount_uploader :image , ImageIndexUploader
    validates :image, presence: true
end
