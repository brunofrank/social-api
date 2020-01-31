class User < ApplicationRecord
  validates :username, uniqueness: true

  has_many :connections, foreign_key: :follower_id, dependent: :destroy
  has_many :reverse_connections, foreign_key: :followed_id,
                                   class_name: 'Connection',
                                   dependent: :destroy

  has_many :followeds, through: :connections
  has_many :followers, through: :reverse_connections, source: :follower


  def follow!(user_to_follow)
    connections.create!(followed_id: user_to_follow.id)
  end

  def unfollow!(user_to_unfollow)
    connections.find_by(followed_id: user_to_unfollow.id).destroy
  end
end
