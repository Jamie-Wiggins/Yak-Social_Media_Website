class Group < ApplicationRecord
    has_many :posts
    has_many :users, through: :posts
    has_one_attached :image
    validates :name, presence: true, uniqueness: true, length: { in: 3..30 }
    validates_format_of :name, with: /^[a-z,_]+$/, :multiline => true
end