class CreateBusinesses < ActiveRecord::Migration[6.0]
  def change
    create_table :businesses do |t|
      t.integer :business_content_id, null: false
      t.integer :survey_id
      t.integer :development_id
      t.date :order_day, null: false
      t.date :delivery_day
      t.date :survey_day, null: false
      t.references :site, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
