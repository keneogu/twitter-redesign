class Tweet < ApplicationRecord
	belongs_to :author, class_name: 'User'

	scope :ordered_by_most_recent, -> { order(created_at: :desc) }
	validates :text, presence: true, length: { maximum: 255 }
end
