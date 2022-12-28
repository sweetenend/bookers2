class UsersController < ApplicationController
  before_action :ensure_correct_user, only: [:edit, :update]
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
    if @user.update(user_params)
      flash[:notice]="You have updated user successfully."
      redirect_to user_path(@user.id)
    else
      render :edit
    end
  end

  def index
    @book=Book.new
    @user=current_user
    @users=User.all
  end

  private

  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end

  def ensure_correct_user
    user=User.find(params[:id])
    if current_user.id!=user.id
      redirect_to user_path(current_user.id)
    end
  end
end
