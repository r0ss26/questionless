# frozen_string_literal: true

class QuestionsController < ApplicationController
  before_action :set_question, only: %i[show]
  before_action :set_user_question, only: %i[edit update destroy]
  before_action :authenticate_user!, only: %i[new edit update destroy]

  # GET /questions
  # GET /questions.json
  def index
    @questions = Question.all
  end

  # GET /questions/1
  # GET /questions/1.json
  def show; end

  # GET /questions/new
  def new
    @question = current_user.questions.new
  end

  # GET /questions/1/edit
  def edit; end

  # POST /questions
  # POST /questions.json
  def create
    @question = current_user.questions.new(question_params)

    respond_to do |format|
      if @question.save
        format.html { redirect_to @question, notice: 'Question was successfully created.' }
        format.json { render :show, status: :created, location: @question }
      else
        format.html { render :new }
        format.json { render json: @question.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /questions/1
  # PATCH/PUT /questions/1.json
  def update
    respond_to do |format|
      if @question.update(question_params)
        format.html { redirect_to @question, notice: 'Question was successfully updated.' }
        format.json { render :show, status: :ok, location: @question }
      else
        format.html { render :edit }
        format.json { render json: @question.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /questions/1
  # DELETE /questions/1.json
  def destroy
    set_question
    @question.destroy
    respond_to do |format|
      format.html { redirect_to questions_url, notice: 'Question was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_question
    @question = Question.find(params[:id])
  end

  # Allow only current user to make change
  def set_user_question
    @question = current_user.questions.find_by_id(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def question_params
    params.require(:question).permit(:title)
  end
end
