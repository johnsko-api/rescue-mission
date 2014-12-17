class Question < ActiveRecord::Base
  has_many :answers, dependent: :destroy
  validates :title, presence: true,
              length: {minimum: 10}
  validates :text, presence: true,
              length: {minimum: 40}
  validates :user_id, presence: true

end
