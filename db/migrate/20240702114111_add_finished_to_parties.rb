class AddFinishedToParties < ActiveRecord::Migration[7.1]
  def change
    add_column :parties, :finished, :boolean
  end
end
