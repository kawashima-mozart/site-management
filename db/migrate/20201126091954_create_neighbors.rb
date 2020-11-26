class CreateNeighbors < ActiveRecord::Migration[6.0]
  def change
    create_table :neighbors do |t|
      t.string :lot_number,    null:false
      t.string :name,          null:false
      t.string :address,       null:false
      t.string :address_now
      t.string :phone_number
      t.boolean :witness
      t.date :witness_day
      t.boolean :imprint
      t.date :imprint_day
      t.integer :status_id,    null:false
      t.text :memo
      t.references :site,      null:false, foreign_key: true
      t.timestamps
    end
  end
end
