class AnswersController < ApplicationController
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
    @question = Question.find_by_id(params[:question_id])
    @answer = @question.answers.find_by_id(params[:id])
  end

  def update
    @question = Question.find_by_id(params[:question_id])
    @answer = @question.answers.find_by_id(params[:id])
    if @answer.user_id == current_user.id
      @answer.update(answer_params)
    end
    redirect_to question_path(@question)
  end

  def destroy
    @question = Question.find_by_id(params[:question_id])
    @answer = @question.answers.find(params[:id])
    if @answer.user_id == current_user.id
      @answer.destroy
    end
    redirect_to question_path(@question)
  end

  private
  def answer_params
    params.require(:answer).permit(:answer)
  end

end
