class Party < ApplicationRecord
  after_initialize :set_list
  after_initialize :set_status
  after_save :set_finished_status
  belongs_to :game
  has_many :solutions

  validates :word, presence: true

  def letters
    ten_letters_list.chars
  end

  def verify
    include_leter?(word, ten_letters_list.chars) &&
      delete_occurence_leter?(word, ten_letters_list.chars) &&
      ApplicationRecord.dictionnary.include?(word.upcase)
  end

  private

  VOYELLES = %w[A E I O U Y]
  CONSONNES = %w[B C D F G H J K L M N P Q R S T V W X Z]

  def set_list
    list = []
    5.times do
      list << VOYELLES.sample
      list << CONSONNES.sample
    end
    self.ten_letters_list = list.join
  end

  def set_status
    self.finished = false
  end

  def set_finished_status
    self.finished = true
  end

  def include_leter?(attempt, grid)
    attempt = attempt.upcase.chars
    result_include_leter = nil
    attempt.each do |leter|
      if grid.include?(leter)
        result_include_leter = true
      else
        result_include_leter = false
        break
      end
    end
    result_include_leter
  end

  def delete_occurence_leter?(attempt, grid)
    attempt = attempt.upcase.chars
    grid.each do |grid_letter|
      attempt.delete_at(attempt.index(grid_letter)) if attempt.include?(grid_letter)
    end
    return attempt.empty?
  end
end
