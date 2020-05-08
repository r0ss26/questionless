# frozen_string_literal: true

# redirect_back(fallback_location: root_path)

class AnswersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_answer, only: %i[edit update destroy]
  before_action :set_answer, only: %i[upvote downvote toggle_bookmark]
  before_action :set_question, only: %i[create toggle_bookmark]

  def index
    @answers = Question.find_by_id(params[:question_id]).answers.all
  end

  def home
    @answers = Answer.order(cached_votes_score: :desc)
  end

  def create
    # @question = Question.find(params[:question_id])
    @answer = @question.answers.create(answer_params.merge(user_id: current_user.id))

    # redirect_to question_path(@question)
    redirect_to_question_path
  end

  def show; end

  def edit
    # set_answer
  end

  def update
    # set_answer

    @answer.update(answer_params) if @answer.user_id == current_user.id

    # redirect_to question_path(@question)
    redirect_to_question_path
  end

  def destroy
    @answer.destroy if @answer.user_id == current_user.id

    # redirect_to question_path(@question)
    redirect_to_question_path
  end

  def upvote
    # @answer = Answer.find(params[:id])
    @answer.upvote_by(current_user)

    # redirect_to question_path(params[:question_id])
    redirect_to_question_path
  end

  def downvote
    # @answer = Answer.find(params[:id])
    @answer.downvote_by(current_user)

    # redirect_to question_path(params[:question_id])
    redirect_to_question_path
  end

  def toggle_bookmark
    # @answer = Answer.find(params[:id])
    # @question = Question.find_by_id(params[:question_id])

    if current_user.bookmarks.include?(@answer)
      current_user.bookmarks.delete(@answer)
    else
      current_user.bookmarks << @answer
    end

    # redirect_to question_path(@question)
    redirect_to_question_path
  end

  def bookmark_list
    @answers = current_user.bookmarks
  end

  private

  def answer_params
    params.require(:answer).permit(:answer)
  end

  def set_answer
    @answer = Answer.find(params[:id])
  end

  def set_question
    @question = Question.find_by_id(params[:question_id])
  end

  def set_answer_question
    @question = Question.find_by_id(params[:question_id])
    @answer = @question.answers.find(params[:id])
  end

  def bookmark_params
    params.require(:bookmark).permit(:answer_id)
  end

  def redirect_to_question_path
    redirect_back(fallback_location: question_path(params[:question_id]))
    # question_path(params[:question_id])
    # question_path(@question)
  end
end
