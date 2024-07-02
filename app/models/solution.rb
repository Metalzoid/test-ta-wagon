class Solution < ApplicationRecord
  belongs_to :party
  before_save :set_score

  private

  def set_score
    self.score = self.word.size
  end
end
