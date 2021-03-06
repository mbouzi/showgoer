class UsersController < ApplicationController

  def index
    @user_liked_video_ids =[]
    @search = Artist.search(params[:q])
    @user = User.new
    if current_user
      @user_liked_vids = User.user_liked_videos(current_user)
      @user_attendance = current_user.attends
    end
  end

  def show
    @user_liked_video_ids =[]
    @user = User.find_by_id(params[:id])
    @user_followers_count = Following.user_originators(@user).count
    @user_followings_count = Following.user_targetors(@user).count
    if current_user
    @user_liked_vids = User.user_liked_videos(current_user)
    @user_attendance = current_user.attends
    end
  end

  def all
    @users = User.all
  end

  def upload

  end

  def edit
    @user = current_user
  end

  def update
    user = current_user
    if user.update(user_edit_params)
     redirect_to user_path(current_user.id)
   else
    [404, "The Page cannot be retrived"]
   end
  end

  def new
    @user = User.new
  end

  def create
   user = User.new(user_params)

   if user.save
    session[:user_id] = user.id
    redirect_to '/'
  else
    redirect_to '/'
  end
end

def signin

end

def signinpost
  c_user = User.find_by(email: params[:user][:email])
  if c_user && c_user.authenticate(params[:user][:password])
    session[:user_id] = c_user.id
    redirect_to '/'
  else
    redirect_to '/'
  end
end

def signout
  session[:user_id] = nil
  redirect_to '/'
end


private
def user_params
  params.require(:user).permit(:username, :email, :password)
end

def user_edit_params
  params.require(:user).permit(:username, :email)
end

end