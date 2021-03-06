# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :omniauthable

  has_one_attached :avatar, dependent: :destroy

  has_many :employments, dependent: :destroy

  has_many :questions, dependent: :destroy

  has_many :answers, dependent: :destroy

  has_many :bookmark_answers, dependent: :destroy
  has_many :bookmarks, through: :bookmark_answers, source: :answer

  after_initialize :init

  def init
    self.name ||= email.split('@')[0]
    self.description ||= ''
  end

  def current_user?(user)
    user == current_user
  end

  def avatar_attachment_path
    avatar.attached? ? avatar : 'default_avatar.svg'
  end
end
