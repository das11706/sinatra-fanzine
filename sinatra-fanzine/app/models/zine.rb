class Zine < ActiveRecord::Base
  validates :title, presence: true
  validates :creator, presence: true
  validates :content, presence: true
  belongs_to :user 
end