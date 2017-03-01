class UsersController < ApplicationController

  def index
  @user = User.find_by_id(session[:user_id])
  end

  def create
    user= User.create(f_name:params[:f_name], l_name:params[:l_name], email: params[:email], password:params[:password], password_confirmation:params[:password_confirmation])

    if user.valid?
        session[:user_id] = user[:id]
      redirect_to '/dashboard'
    else
      render json: user.errors
    end

  end

  def login
    user=User.find_by_email(params[:email])

    if user && user.authenticate(params[:password])
      session[:user_id] = user[:id]
      redirect_to '/dashboard'
    else
       render text: "Either email or password was incorrect"
    end
    end

  def logout
    session.clear
    redirect_to '/'
  end

  def dashboard

    @groups= Group.all
    @user = User.find (session[:user_id])
    @all_joins = Join.where(user: User.find(session[:user_id]))

  end

  def group_create

      group=Group.create(name:params[:name], desc:params[:desc], user_id:session[:user_id])

      redirect_to '/dashboard'
      end

  def destroy_dashboard
       Group.find(params[:id]).destroy
      #  render text: params[:id]
       redirect_to "/dashboard"
    end

    def group_info
        @user = User.find_by_id(session[:user_id])
        @group= Group.find(params[:id])
        @users_in_group = Group.find(params[:id]).users

    end

    def join
    double = Join.where(group: Group.find(params[:id]), user: User.find(session[:user_id]))
    if double.empty?
      Join.create(group: Group.find(params[:id]), user: User.find(session[:user_id]))
    end
    redirect_to "/groups/#{params[:id]}"
  end


    def unjoin

      Join.where(user:User.find(session[:user_id]), group:Group.find(params[:id])).destroy_all
      redirect_to "/groups/#{params[:id]}"

    end













end
