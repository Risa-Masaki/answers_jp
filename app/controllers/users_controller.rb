class UsersController < ApplicationController
  def show
    user = User.find(params[:id])
    @avatar = user.avatar
    @name = user.name
    @age = user.age
    @station = user.station
    @apply = user.apply
    @availability = user.availability
    @questions = user.questions.page(params[:page]).per(5).order("created_at DESC")
  end

  def edit

  end

  def update
    current_user.update(update_params)
  end

  def index
    @users = User.page(params[:page]).per(10)
  end

  private
  def update_params
    params.require(:user).permit(:email, :name, :age, :station, :apply, :availability, :interest, :introduction, :avatar)
  end
end
