class CreateRoutes < ActiveRecord::Migration
  def change
    create_table :routes do |t|
      t.string :from_city
      t.string :to_city
      t.integer :from_city_id
      t.integer :to_city_id

      t.timestamps null: false
    end
  end
end
