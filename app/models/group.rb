class Group < ApplicationRecord
    has_many :posts, dependent: :destroy
    has_many :users, through: :posts
    has_one_attached :image
    validates :admin_id, presence: true
    validates :name, presence: true, uniqueness: true, length: { in: 3..30 }
    validates_format_of :name, with: /^[a-z,_]+$/, :multiline => true
end