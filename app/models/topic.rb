class Topic < ActiveRecord::Base
    belongs_to :coach
    validates :title, presence: true, length: {minimum: 5, maximum: 100}
    validates :body, presence: true, length: {minimum: 5, maximum: 500}
    mount_uploader :picture, PictureUploader
    validate :picture_size
    
    private
      def picture_size
        if picture.size > 5.megabytes
          errors.add(:picture, "should be less than 5MB")
        end
      end
end