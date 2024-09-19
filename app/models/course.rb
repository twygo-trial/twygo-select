class Course < ApplicationRecord
    has_many :videos, dependent: :destroy
    validates :title, :description, :end_date, presence: true
  
    def self.active_courses
      where('end_date >= ?', Date.today)
    end
  
    def total_video_size
      videos.sum(:size)
    end
  end