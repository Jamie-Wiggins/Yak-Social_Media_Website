class Relationship < ActiveRecord::Base
    # A relationship belongs to a follower, which will have a class of user
    belongs_to :follower, class_name: "User"
    # A relationship belongs to a followed, which will have a class of user
    belongs_to :followed, class_name: "User"

    # Validations

    # follwer_id and followed_id must both be present
    validates :follower_id, :followed_id, presence: true
end