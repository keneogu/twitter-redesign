class User < ApplicationRecord
	has_many :tweets, foreign_key: :author_id, dependent: :destroy

	
	validates :username, presence: true, uniqueness: true, length: { maximum: 20 }
end
