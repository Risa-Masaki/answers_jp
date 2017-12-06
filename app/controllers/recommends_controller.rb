class RecommendsController < ApplicationController
  def create
    Recommend.create(recommend_params)
    redirect_to user_path(params[:user_id])
  end

  private
  def recommend_params
    params.require(:recommend).permit(:text).merge(user_id: params[:user_id], writer_id: current_user.id)
  end

end
