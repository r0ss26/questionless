# frozen_string_literal: true

class BookmarkAnswer < ApplicationRecord
  belongs_to :answer
  belongs_to :user

  validates :answer, :user, presence: true
end
