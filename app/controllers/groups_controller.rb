class GroupsController < ApplicationController
    # sets the groups before any actions are run
    before_action :set_group, only: [:show, :edit, :update, :destroy]
    # checks user is logged in before running any actions
    before_action :authenticate_user!, except: [:index, :show]

    # GET /groups/new
    def new
      @group = Group.new
    end
  
    # GET /groups/1/edit
    def edit
    end
  
    # POST /groups
    # POST /groups.json
    # Redirects to the home page (root) upon save
    def create
      @group = Group.new(group_params)
  
      respond_to do |format|
        if @group.save
          format.html { redirect_to :root, notice: t('.group_made') }
          format.json { render :show, status: :created, location: @group }
        else
          format.html { render :new }
          format.json { render json: @group.errors, status: :unprocessable_entity }
        end
      end
    end
  
    # PATCH/PUT /groups/1
    # PATCH/PUT /groups/1.json
    # Redirects to the home page (root) upon update
    def update
      respond_to do |format|
        if @group.update(group_params)
          format.html { redirect_to :root, notice: t('.group_made') }
          format.json { render :show, status: :ok, location: @group }
        else
          format.html { render :edit }
          format.json { render json: @group.errors, status: :unprocessable_entity }
        end
      end
    end
  
    # DELETE /groups/1
    # DELETE /groups/1.json
    # Redirects to the home page (root) upon destroy
    def destroy
      @group.destroy
      respond_to do |format|
        format.html { redirect_to :root, notice:  t('.group_delete') }
        format.json { head :no_content }
      end
    end
  
    private
      # Use callbacks to share common setup or constraints between actions.
      def set_group
        @group = Group.find(params[:id])
      end
  
      # Groups params that can be passed; name, admin_id, user_id, and image
      def group_params
        params.require(:group).permit(:name, :admin_id, :user, :image)
      end
  end
  