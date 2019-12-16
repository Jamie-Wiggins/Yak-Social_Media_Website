class Post < ApplicationRecord
    # A post belongs to a group
    belongs_to :group
    # A post belongs to a user
    belongs_to :user
    # A post has many replies which are depenedent
    # so when a post is destroyed so is its replies
    has_many :replies, dependent: :destroy
    
    #Validations

    # content, user_id and group_id must be present
    validates :content, :user_id, :group_id, presence: true
    # color must be of length 7 (to fit the hex format)
    validates :color, length: { is: 7 }
    # color must start with a # and be in the correct format for a hex color
    validates_format_of :color, with: /#([A-Fa-f0-9]{6}|[A-Fa-f0-9]{3})$/, :multiline => true
    # text color must be of length 7
    validates :text_color, length: { is: 7 }
    # text color must start with a # and be in the correct format for a hex color
    validates_format_of :text_color, with: /#([A-Fa-f0-9]{6}|[A-Fa-f0-9]{3})$/, :multiline => true
    # font size must be length 2
    validates :font_size, length: { is: 2 }
    # font size must only consist of numbers
    validates_format_of :font_size, with: /^[0-9]*/, :multiline => true
end