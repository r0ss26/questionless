class AnswersController < ApplicationController
  def index
    @answers = Question.find_by_id(params[:id]).answers.all
  end

  def create
    # @answer = Answer.create()
  end

  def show

  end

  def update

  end

  def destroy

  end
end
