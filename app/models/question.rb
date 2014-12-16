class Question < ActiveRecord::Base
  has_many :answers
  validates :title, presence: true,
              length: {minimum: 10}
  validates :text, presence: true,
              length: {minimum: 40}
end
