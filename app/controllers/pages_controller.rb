class PagesController < ApplicationController
  # checks user is logged in before running any other actions
  # if not signed in the user will only have access to the home page
  before_action :authenticate_user!, except: [:home]

  # authenticates the current user
  def authenticate
    redirect_to(registration_path) unless current_user.nil?
  end
  
  # home action which displays all posts, and groups
  def home
    @posts = Post.all.order('created_at desc')
    @groups = Group.all
    @post = Post.new
    @group = Group.new
  end
  
  # profile pages action
  def profile
    # gets the username from the URL as :id
    if (User.find_by_username(params[:id]))
      @username = params[:id]
    else 
      redirect_to root_path, :notice=> t('.not_found')
    end
    # find all the post for one particular user
    @posts = Post.all.where("user_id = ?", User.find_by_username(params[:id]).id)
    @groups = Group.all
  end
  
  # group pages action
  def group
    # gets the group from the URL as :id
    if (Group.find_by_name(params[:id]))
      @name = params[:id]
    else 
      redirect_to root_path, :notice=> t('.not_found') 
    end
    @users = User.all
    # gets all the posts for a particular group
    @posts = Post.all.where("group_id = ?", Group.find_by_name(params[:id]).id)
  end
  
  # contact pages action
  def contact
  end
  
  # request contact action
  def request_contact
    name = params[:name]
    email = params[:email]
    message = params[:message]
    
    # if email is blank, alert no email
    if email.blank?
      flash[:alert]=("no email")
    else
      # send the email
      ContactMailer.contact_email(email, name, message).deliver_now
      flash[:notice]=("sent")
    end
    # redirect to the home page (root path)
    redirect_to root_path
    end
  end