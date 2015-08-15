class Topic < ActiveRecord::Base
    belongs_to :coach
    validates :title, presence: true, length: {minimum: 5, maximum: 100}
    validates :body, presence: true, length: {minimum: 5, maximum: 500}
end