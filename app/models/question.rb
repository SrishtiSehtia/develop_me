class Question < ApplicationRecord
  validates :question, presence: true
  belongs_to :user
end
