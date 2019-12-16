class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  # A user has many posts, which are dependent
  # so when a user is destoryed so will the posts related to that user
  has_many :posts, dependent: :destroy
  # A user has many groups through posts
  has_many :groups, through: :posts
  # A user can have many active relationships - follwer other users
  has_many :active_relationships, class_name: "Relationship", foreign_key: "follower_id", dependent: :destroy
  # A user can have many passive relationships - not following other users
  has_many :passive_relationships, class_name: "Relationship", foreign_key: "followed_id", dependent: :destroy
  # A user has many users following through the active relationships
  has_many :following, through: :active_relationships, source: :followed
  # A user has many followers through passive relationships
  has_many :followers, through: :passive_relationships, source: :follower

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
  
  # Validations

  # email must be present and unique
  validates :email, presence: true, uniqueness: true
  # email must be of format any letters @ symbol and then letters '.' letters 
  validates_format_of :email, with: /[^@]+@[^\.]+\..+/, :multiline => true
  # username must be present, unique and between length of 2 to 20
  validates :username, presence: true, uniqueness: true, length: { in: 2..20 }
  # username must be of format any letters or numbers and underscores
  validates_format_of :username, with: /^[A-Za-z0-9]+(?:[_][A-Za-z0-9]+)*$/, :multiline => true
  # first name, last name abd pasword must all be present
  validates :first_name, :last_name, :password, presence: true
  # validates the format of first and last name, which must only contain letters
  validates_format_of :first_name, :last_name, with: /^[a-z]+$/, :multiline => true
  # validates format of password which must be longer than 8 characters and contain both letters and numbers
  validates_format_of :password, with: /^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$/, :multiline => true
end
