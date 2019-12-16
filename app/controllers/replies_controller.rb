class RepliesController < ApplicationController
    # checks user is logged in before running any actions
    before_action :authenticate_user!
    # sets some of the reply action before any a actions are run
    before_action :set_reply, only: [:edit, :update, :show, :destroy]
    # sets the post before any actions are run
    before_action :set_post, only: [:create, :edit, :show, :update, :destroy]
  
    # creates a reply which is related to the post it is created on
    # creates a link between the current user id and the id of the reply
    def create
      @reply = @post.replies.create(params[:reply].permit(:reply, :post_id))
      @reply.user_id = current_user.id
  
      respond_to do |format|
        if @reply.save
          format.html { redirect_to post_path(@post) }
          # renders the js - allowing replies to be created without reloading the page
          format.js
        else
          format.html { redirect_to post_path(@post), notice: t('.reply_not_saved')}
          format.js
        end
      end
    end
  
    # destroys replies and redirects to the post that the reply was on
    def destroy
      @reply = @post.replies.find(params[:id])
      @reply.destroy
      redirect_to post_path(@post)
    end
  
    # allows a reply to be edited
    def edit
      @post = Post.find(params[:post_id])
      @reply = @post.replies.find(params[:id])
    end
  
    # Redirects to the post which the reply is on upon update
    def update
      @reply = @post.replies.find(params[:id])
       respond_to do |format|
        if @reply.update(reply_params)
          format.html { redirect_to post_path(@post), notice: 'Reply was successfully updated.' }
        else
          format.html { render :edit }
          format.json { render json: @reply.errors, status: :unprocessable_entity }
        end
      end
    end
  
    private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:post_id])
    end
  
    def set_reply
      @reply = Reply.find(params[:id])
    end
  
    # Reply params that can be passed, reply
    def reply_params
      params.require(:reply).permit(:reply)
    end
  end