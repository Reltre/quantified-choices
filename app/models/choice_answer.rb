class ChoiceAnswer < ActiveRecord::Base
  belongs_to :choice
  belongs_to :answer
end
