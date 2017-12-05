class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @recommend = Recommend.new
    @recommends = @user.recommends.includes(:user)
    @questions = @user.questions.page(params[:page]).per(5).order("created_at DESC")
  end

  def edit
  end

  def update
    current_user.update(update_params)
    if params.require(:user)[:apply] == "YES" then
      redirect_to root_path
    else
      redirect_to new_restaurant_path
    end
  end

  def index
    @users = User.where("apply = 'YES'").order("updated_at DESC").page(params[:page]).per(5)
  end

  private
  def update_params
    params.require(:user).permit(:email, :name, :age, :station, :apply, :availability, :interest, :introduction, :avatar)
  end
end
