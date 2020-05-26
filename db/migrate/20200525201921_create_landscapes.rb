class CreateLandscapes < ActiveRecord::Migration[6.0]
  def change
    create_table :landscapes do |t|
      t.integer :team_id
      t.integer :user_id
      t.string :address
      t.integer :area
    
      t.timestamps
    end
  end
end
