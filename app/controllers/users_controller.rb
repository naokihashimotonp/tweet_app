class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find_by(id: params[:id])
  end

  def create
    @user = User.new(name: params[:name], email: params[:email])
    if @user.save
      redirect_to("/users/#{@user.id}")
      flash[:notice] = "ユーザー登録が完了しました"
    else
      render("users/new")
      flash[:notice]
    end
  end

  def new
    @user = User.new
  end

  def edit
    @user = User.find_by(id: params[:id])
  end

  def update
    @user = User.find_by(id: params[:id])
    @user.name = params[:name]
    @user.email = params[:email]
    if @user.save
      redirect_to("users/#{@user.id}/show")
      flash[:notce] = "ユーザー情報を編集しました"
    else
      render("users/edit")
      flash[:notice]
    end
  end

end
