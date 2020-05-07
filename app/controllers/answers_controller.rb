class AnswersController < ApplicationController
  before_action :authenticate_user!, only: %i[upvote downvote]

  def index
    @answers = Question.find_by_id(params[:question_id]).answers.all
  end

  def create
    @question = Question.find(params[:question_id])
    @answer = @question.answers.create(answer_params.merge(user_id: current_user.id))
    redirect_to question_path(@question)
  end

  def show
    
  end

  def edit
    set_answer
  end

  def update
    set_answer

    if @answer.user_id == current_user.id
      @answer.update(answer_params)
    end
    redirect_to question_path(@question)
  end

  def destroy
    set_answer

    if @answer.user_id == current_user.id
      @answer.destroy
    end
    redirect_to question_path(1)
  end

  def upvote
    @answer = Answer.find(params[:id])
    @answer.upvote_by(current_user)
    redirect_to question_path(params[:question_id])
  end

  def downvote
    @answer = Answer.find(params[:id])
    @answer.downvote_by(current_user)
    redirect_to question_path(params[:question_id])
  end

  private
  def answer_params
    params.require(:answer).permit(:answer)
  end

  def set_answer
    @question = Question.find_by_id(params[:question_id])
    @answer = @question.answers.find(params[:id])
  end
end
