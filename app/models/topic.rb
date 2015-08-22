class Topic < ActiveRecord::Base
    belongs_to :coach
    has_many :likes
    validates :title, presence: true, length: {minimum: 5, maximum: 100}
    validates :body, presence: true, length: {minimum: 5, maximum: 500}
    mount_uploader :picture, PictureUploader
    validate :picture_size
    default_scope -> { order(updated_at: :desc) }
    
    def thumbs_up_total
      self.likes.where(like: true).size
    end
    
    def thumbs_down_total
      self.likes.where(like: false).size
    end
    
    private
      def picture_size
        if picture.size > 5.megabytes
          errors.add(:picture, "should be less than 5MB")
        end
      end
end