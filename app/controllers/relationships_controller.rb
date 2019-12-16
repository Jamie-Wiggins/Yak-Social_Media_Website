class RelationshipsController < ApplicationController
    # creates a relationship between two users and allows one to follow another
    def create
        user = User.find(params[:followed_id])
        current_user.follow(user)
        redirect_back(fallback_location: root_path)
    end

    # destroys a relationship between two users so they are no longer following each other
    def destroy
        user = Relationship.find(params[:id]).followed
        current_user.unfollow(user)
        redirect_back(fallback_location: root_path)
    end
end