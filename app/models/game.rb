class Game < ApplicationRecord
  belongs_to :user
  has_many :parties, -> { limit(5) }

  def score
    score = 0
    parties.each do |party|
      party.solutions.each do |solution|
        score += solution.score
      end
    end
    score
  end
end
