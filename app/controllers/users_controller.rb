class UsersController < ApplicationController
  def show
    user = User.find(params[:id])
    @name = user.name
    @questions = user.questions.page(params[:page]).per(5).order("created_at DESC")
  end

  def edit

  end
end
