class ChangeDate < ActiveRecord::Migration
  def change
    change_column(:shots, :departure_time, :datetime)
    change_column(:shots, :arrival_time, :datetime)
  end
end
