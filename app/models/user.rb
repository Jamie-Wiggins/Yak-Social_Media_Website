class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :posts, dependent: :destroy
  has_many :groups, through: :posts
  # following section
  has_many :active_relationships, class_name: "Relationship", foreign_key: "follower_id", dependent: :destroy
  has_many :passive_relationships, class_name: "Relationship", foreign_key: "followed_id", dependent: :destroy
  has_many :following, through: :active_relationships, source: :followed
  has_many :followers, through: :passive_relationships, source: :follower
  
  validates :email, presence: true, uniqueness: true
  validates_format_of :email, with: /[^@]+@[^\.]+\..+/, :multiline => true
  validates :username, presence: true, uniqueness: true, length: { in: 2..20 }
  validates_format_of :username, with: /^[A-Za-z0-9]+(?:[ _-][A-Za-z0-9]+)*$/, :multiline => true
  validates :first_name, presence: true
  validates_format_of :first_name, with: /^[a-z]+$/, :multiline => true
  validates :last_name, presence: true
  validates_format_of :last_name, with: /^[a-z]+$/, :multiline => true
  validates :password, presence: true
  validates_format_of :password, with: /^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$/, :multiline => true
  
  # helper methods
  
  # follow another user
  def follow(other)
    active_relationships.create(followed_id: other.id)
  end
  
  # unfollow a user
  def unfollow(other)
    active_relationships.find_by(followed_id: other.id).destroy
  end
  
  # is following a user?
  def following?(other)
    following.include?(other)
  end
end
