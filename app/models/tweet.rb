class Tweet < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_many :likes, dependent: :destroy

  scope :ordered_by_most_recent, -> { order(created_at: :desc) }
  validates :text, presence: true, length: { maximum: 255 }

  def likes
    Tweet.joins(:likes).where(id: id).count
  end
end
