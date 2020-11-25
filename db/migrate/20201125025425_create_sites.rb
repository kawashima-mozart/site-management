class CreateSites < ActiveRecord::Migration[6.0]
  def change
    create_table :sites do |t|
      t.string :name, null: false
      t.string :customer, null: false
      t.timestamps
    end
  end
end
