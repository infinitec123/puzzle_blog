class Puzzle < ActiveRecord::Base
  attr_accessible :difficulty, :question, :solution, :title
  # validates :title, :length => { :minimum => 5 }
  validates :title, presence: true,
                    length: { minimum: 5 }
  validates :question, presence: true,
                    length: { minimum: 10 }
  validates :solution, presence: true,
                    length: { minimum: 10 }   
  #Still to validate difficulty
end
