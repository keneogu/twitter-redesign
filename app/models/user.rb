class User < ApplicationRecord
	has_many :tweets, foreign_key: :author_id, dependent: :destroy
	
	has_many :active_relationships, class_name: "Relationship", foreign_key: "follower_id", dependent: :destroy
	has_many :followings, through: :active_relationships, source: :followed

	has_many :passive_relationships, class_name: "Relationship", foreign_key: "followed_id", dependent: :destroy
	has_many :followers, through: :passive_relationships

	validates :username, presence: true, uniqueness: true, length: { maximum: 20 }

	def follow(other_user)
		active_relationships.create(followed_id: other_user.id)
	end
		
	def unfollow(other_user)
		active_relationships.find_by(followed_id: other_user.id).destroy
	end 
end
