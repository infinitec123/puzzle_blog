class Lpuzzle < ActiveRecord::Base
  
  DIFFICULTY_LEVELS = ["Easy", "Medium", "Difficult", "Tough"]

  attr_accessible :difficulty, :hint, :image_url, :question, :solution, :title

  validates :title, presence: true, uniqueness: true, 
                    length: { minimum: 5 }
  validates :question, presence: true,
                    length: { minimum: 10 }
  validates :solution, presence: true,
                    length: { minimum: 10 }   

  validates :difficulty, inclusion: DIFFICULTY_LEVELS


   validates :image_url, allow_blank: true, format: { with: %r{\.(gif|jpg|png)$}i,
		message: 'must be a URL for GIF, JPG or PNG image.' }

   validates :hint, presence: true, uniqueness: true, 
                    length: { minimum: 5 }
end
