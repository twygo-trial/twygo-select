class Video < ApplicationRecord
  belongs_to :course
  validates :size, presence: true

  has_one_attached :file # Associa um arquivo de vídeo

  validates :file, presence: true # Valida a presença do arquivo

  def resize_course
    # Update the course size (e.g., add the video size to the course size)
    course.video_size += size

    # Save the changes to the course
    course.save
  end
end
