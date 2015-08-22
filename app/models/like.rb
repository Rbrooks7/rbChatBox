class Like < ActiveRecord::Base
   belongs_to :coach
   belongs_to :topic 
   
   validates_uniqueness_of :coach,  scope: :topic 
end