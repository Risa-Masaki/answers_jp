class QuestionsController < ApplicationController

  before_action :move_to_index, except: :index

  def index
    @questions = Question.includes(:user).page(params[:page]).per(5).order("created_at DESC")
  end

  def new
    @question = Question.new
  end

  def create
    Question.create(text: question_params[:text], image: question_params[:image], user_id: current_user.id)
  end

  def destroy
    question = Question.find(params[:id])
    question.destroy if question.user_id == current_user.id
  end

  def edit
    @question = Question.find(params[:id])
  end

  def update
    question = Question.find(params[:id])
    if question.user_id == current_user.id
      question.update(question_params)
    end
  end

  def show
    @question = Question.find(params[:id])
    @answer = Answer.new
    @answers = @question.answers.includes(:user)
  end

  private
  def question_params
    params.permit(:text, :image)
  end

  def move_to_index
    redirect_to action: :index unless user_signed_in?
  end

end
