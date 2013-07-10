class Puzzle < ActiveRecord::Base
  
  DIFFICULTY_LEVELS = ["Easy", "Medium", "Difficult", "Tough"]

  attr_accessible :difficulty, :question, :solution, :title, :image_url
  # validates :title, :length => { :minimum => 5 }
  validates :title, presence: true, uniqueness: true, 
                    length: { minimum: 5 }
  validates :question, presence: true,
                    length: { minimum: 10 }
  validates :solution, presence: true,
                    length: { minimum: 10 }   

	validates :image_url, allow_blank: true, format: { with: %r{\.(gif|jpg|png)$}i,
		message: 'must be a URL for GIF, JPG or PNG image.'



  }

  #Still to validate difficulty
end
