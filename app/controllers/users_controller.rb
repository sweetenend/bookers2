class UsersController < ApplicationController
  def show
    @book=Book.new
    @user=User.find(params[:id])
    @books=@user.books
  end

  def edit
    @user=User.find(params[:id])
  end

  def update
    @user=User.find(params[:id])
    @user.update(user_params)
    redirect_to user_path(@user.id)
  end

  def index
    @book=Book.new
    @user=current_user
    @users=User.all
  end

  private

  def user_params
    params.riquire(:user).permit(:name, :profile_image, :introduction)
  end
end
