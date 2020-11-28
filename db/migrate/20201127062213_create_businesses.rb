class CreateBusinesses < ActiveRecord::Migration[6.0]
  def change
    create_table :businesses do |t|
      t.integer :business_content_id, null: false
      t.integer :survey_id
      t.integer :development_id
      t.date :order_day, null: false
      t.boolean :delivery_day
      t.references :site

      t.timestamps
    end
  end
end
