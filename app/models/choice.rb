class Choice < ActiveRecord:Base
  #has_many :categories, through: choice_categories
  has_one :answer

  validates :name, presence: true
  validates :answer_ids, presence: true
end
