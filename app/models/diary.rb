class Diary < ApplicationRecord
    has_many :user_diaries, dependent: :destroy
    belongs_to :user
    
    
    has_many :images, dependent: :destroy
    mount_uploader :image, ImageUploader
    #carrierwave multiple機能用？した
    serialize :images, JSON
end
