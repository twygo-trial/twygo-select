class Video < ApplicationRecord
  belongs_to :course
  validates :url, :size, presence: true
end