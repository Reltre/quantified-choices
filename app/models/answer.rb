class Answer < ActiveRecord::Base
  #has_many :categories, through: choice_categories
  has_many :choice_answers
  has_many :choices, through: :choice_answers

  # validates :name, presence: true
  # validates :answer_ids, presence: true
end
