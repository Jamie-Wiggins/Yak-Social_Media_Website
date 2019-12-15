class Post < ApplicationRecord
    belongs_to :group
    belongs_to :user
    has_many :profiles, through: :user
    has_many :replies, dependent: :destroy
    
    validates :content, presence: true
    validates :color, length: { is: 7 }
    validates_format_of :color, with: /#([A-Fa-f0-9]{6}|[A-Fa-f0-9]{3})$/, :multiline => true

    validates :text_color, length: { is: 7 }
    validates_format_of :text_color, with: /#([A-Fa-f0-9]{6}|[A-Fa-f0-9]{3})$/, :multiline => true
    
    # validates_format_of :font_type, with: /^[a-zA-Z]+$/, :multiline => true
    
    # validates_format_of :font_size, with: /^[0-9]*/, :multiline => true
    
    validates :user_id, :group_id, presence: true   
end