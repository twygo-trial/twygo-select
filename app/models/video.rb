class Video < ApplicationRecord
  belongs_to :course
  validates :size, presence: true

  has_one_attached :file

  validates :file, presence: true

  def increment_course
    course.video_size += size
    course.save
  end

  def decrement_course
    course.video_size -= size
    course.save
  end
end
