class Group < ApplicationRecord
    # groups has many posts, that are depenedent 
    # Therefore when a group is destoryed, so will its posts
    has_many :posts, dependent: :destroy
    # groups has many users through posts
    has_many :users, through: :posts
    # groups has one image
    has_one_attached :image

    #Validations
    # admin_id must always be present 
    validates :admin_id, presence: true
    # name must always be present, unique, and between a length of 3 and 30
    validates :name, presence: true, uniqueness: true, length: { in: 3..30 }
    # the format of a name must be only letters and underscores
    validates_format_of :name, with: /^[a-z,_]+$/, :multiline => true
end