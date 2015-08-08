class Choice < ActiveRecord::Base
  #has_many :categories, through: choice_categories
  has_many :choice_answers
  has_many :answers, through: :choice_answers

  # validates :name, presence: true
  # validates :answer_ids, presence: true

  def largest_percentage
    times = self.answers.map { |answer| answer.times }
    (times.max.to_f / times.reduce(:+).to_f) * 100.00
  end

  def smallest_percentage
    times = self.answers.map { |answer| answer.times }
    (times.min.to_f / times.reduce(:+).to_f) * 100.00
  end
end
