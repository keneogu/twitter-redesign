class User < ApplicationRecord
	has_many :tweets, foreign_key: :author_id, dependent: :destroy

	validates :full_name, presence: true, length: { maximum: 20 }
	validates :username, presence: true, uniqueness: true, length: { maximum: 20 }
	validates :password, presence: true, length: { minimum: 6 }
end
