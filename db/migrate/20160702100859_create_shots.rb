class CreateShots < ActiveRecord::Migration
  def change
    create_table :shots do |t|
      t.string :from_city
      t.string :to_city
      t.string :travel_date
      t.string :rb_pref_code
      t.string :is_bp_dp_search
      t.string :j_dur
      t.string :service_id
      t.string :service_name
      t.string :vehicle_type
      t.string :is_dpa
      t.string :boarding_location
      t.string :boarding_points
      t.string :drop_location
      t.string :drop_points
      t.string :arrival_time
      t.string :bus_type
      t.string :departure_time
      t.string :fare
      t.string :ac
      t.string :not_ac
      t.string :seater
      t.string :sleeper
      t.string :is_spf
      t.string :is_mte
      t.string :seats_available
      t.string :window_seats
      t.string :operator_id
      t.string :rt_id
      t.string :operator
      t.string :rating
      t.string :rating_count
      t.string :tips
      t.string :glry
      t.string :sort
      t.string :bs_st
      t.string :bs_sv_id

      t.timestamps null: false
    end
  end
end
