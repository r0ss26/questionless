class Answer < ApplicationRecord
  belongs_to :user
  belongs_to :question
  acts_as_votable
end
