require "csv"
require "i18n"
class ApplicationRecord < ActiveRecord::Base
  primary_abstract_class

  def self.dictionnary
    @dictionnary = []
    CSV.foreach(Rails.root.join('storage', 'dictionnary.csv')) do |row|
      @dictionnary << I18n.transliterate(row[0].upcase)
    end
    return @dictionnary
  end
end
