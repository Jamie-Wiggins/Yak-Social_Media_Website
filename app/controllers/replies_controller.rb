class RepliesController < ApplicationController
    before_action :authenticate_user!
    before_action :set_reply, only: [:edit, :update, :show, :destroy]
    before_action :set_post, only: [:create, :edit, :show, :update, :destroy]
  
    def create
      @reply = @post.replies.create(params[:reply].permit(:reply, :post_id))
      @reply.user_id = current_user.id
  
      respond_to do |format|
        if @reply.save
          format.html { redirect_to post_path(@post) }
          format.js # renders create.js.erb
        else
          format.html { redirect_to post_path(@post), notice: "Reply did not save. Please try again."}
          format.js
        end
      end
    end
  
    def new
    end
  
  
    def destroy
      @reply = @post.replies.find(params[:id])
      @reply.destroy
      redirect_to post_path(@post)
    end
  
    def edit
      @post = Post.find(params[:post_id])
      @reply = @post.replies.find(params[:id])
    end
  
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
  
    def show
    end
  
    private
  
    def set_post
      @post = Post.find(params[:post_id])
    end
  
    def set_reply
      @reply = Reply.find(params[:id])
    end
  
    def reply_params
      params.require(:reply).permit(:reply)
    end
  end