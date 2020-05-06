class AnswersController < ApplicationController
  def index
    @answers = Question.find_by_id(params[:question_id]).answers.all
  end

  def create
    @question = Question.find(params[:question_id])
    @answer = @question.answers.create(answer_params)
    redirect_to question_path(@question)
  end

  def show

  end

  def update

  end

  def destroy

  end

  private
  def answer_params
    params.require(:answer).permit(:answer)
  end
end
