class Question < ApplicationRecord
  belongs_to :user
  has_many :answers, dependent: :destroy
  acts_as_taggable_on :tags
end
