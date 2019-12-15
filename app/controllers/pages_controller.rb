class PagesController < ApplicationController
  before_action :authenticate_user!, except: [:home]

    def authenticate
      redirect_to(registration_path) unless current_user.nil?
    end
    
    def home
      @posts = Post.all.order('created_at desc')
      @groups = Group.all
      @post = Post.new
      @group = Group.new
    end
  
    # back-end code for pages/profile
    def profile
      # grab the username from the URL as :id
      if (User.find_by_username(params[:id]))
        @username = params[:id]
      else 
        # redirect to 404 (root for now)
        redirect_to root_path, :notice=> "User not found!" 
      end
      
      @posts = Post.all.where("user_id = ?", User.find_by_username(params[:id]).id)
      @groups = Group.all
    end
  
    def group
      if (Group.find_by_name(params[:id]))
        @name = params[:id]
      else 
        # redirect to 404 (root for now)
        redirect_to root_path, :notice=> "Group not found!" 
      end
      @users = User.all
      @posts = Post.all.where("group_id = ?", Group.find_by_name(params[:id]).id)
    end
  
    def contact
    end
  
    def request_contact
      name = params[:name]
      email = params[:email]
      message = params[:message]
  
      if email.blank?
        flash[:alert]=("no email")
      else
        #send email
        ContactMailer.contact_email(email, name, message).deliver_now
        flash[:notice]=("sent")
      end
  
      redirect_to root_path
  
    end
    
  end