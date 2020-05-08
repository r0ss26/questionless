# frozen_string_literal: true

class Answer < ApplicationRecord
  belongs_to :user
  belongs_to :question

  has_many :bookmark_answers
  has_many :bookmarked_by, through: :bookmark_answers, source: :user

  acts_as_votable
end
