class PostsController < ApplicationController
    # sets the posts before any actions are run
    before_action :set_post, only: [:show, :edit, :update, :destroy]
    # sets the groups before any actions are run    
    before_action :find_groups, only: [:index, :show, :new, :edit]
    # checks user is logged in before running any actions
    before_action :authenticate_user!, except: [:index, :show]
  
    # A search function to return all posts which contain the string that is search
    def search
      @posts = Post.all.where("content LIKE ?","%"+params[:q]+"%")
    end
  
    # GET /posts/new
    # Building a new bost to with the current user
    def new
      @post = current_user.posts.build
    end
  
    # GET /posts/1/edit
    def edit
    end
  
    # POST /posts
    # POST /posts.json
    # Redirects to the home page (root) upon creation
    def create
      @post = current_user.posts.build(post_params)

      respond_to do |format|
        if @post.save
          format.html { redirect_to root_path, notice: t('.post_made') }
          format.json { render :show, status: :created, location: @post }
          format.js
        else
          format.html { render new }
          format.json { render json: @post.errors, status: :unprocessable_entity }
        end
      end
    end
  
    # PATCH/PUT /posts/1
    # PATCH/PUT /posts/1.json
    # Redirects to the home page (root) upon update of a post
    def update
      respond_to do |format|
        if @post.update(post_params)
          format.html { redirect_to root_path, notice: t('.post_updated') }
          format.json { render :show, status: :ok, location: @post }
        else
          format.html { render :edit }
          format.json { render json: @post.errors, status: :unprocessable_entity }
        end
      end
    end
  
    # DELETE /posts/1
    # DELETE /posts/1.json
    # Redirects to the home page (root) upon deletion of a post
    def destroy
      @post.destroy
      respond_to do |format|
        format.html { redirect_to root_path, notice: t('.post_delete') }
        format.json { head :no_content }
      end
    end
  
    private
      # Use callbacks to share common setup or constraints between actions.
      def set_post
        @post = Post.find(params[:id])
      end
  
      # finds all the groups
      def find_groups
        @groups = Group.all.order('created_at desc')
      end
    
      # Post params allows content, color, text color, font type, font size and group id to pass through
      def post_params
        params.require(:post).permit(:content, :color, :text_color, :font_type, :font_size, :group_id)
      end
  end
  