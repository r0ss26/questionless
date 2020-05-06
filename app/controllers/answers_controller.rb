class AnswersController < ApplicationController
  def index
    @answers = Question.find_by_id(params[:id]).answers.all
  end

  def create
    @answer = Question.find_by_id(params[:id]).create(answer_params)
  end

  def show

  end

  def update

  end

  def destroy

  end

  private
  def answer_params
    params.require(:answer).permit(:answer, :question_id, :user_id)
  end
end
