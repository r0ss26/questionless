# frozen_string_literal: true

class SearchesController < ApplicationController
  def index
    q = params[:q]
    @users = User.search(name_cont: q).result
    @answers = Answer.search(name_cont: q).result
    @questions = Question.search(name_cont: q).result
    @tags = ActsAsTaggableOn::Tag.all.search(name_cont: q).result
  end
end
