class Reply < ApplicationRecord  
    # A reply belongs to a post
    belongs_to :post
    # A reply belongs to a user
    belongs_to :user

    #Validations

    # a reply must always be present
    validates :reply, presence: true
end
