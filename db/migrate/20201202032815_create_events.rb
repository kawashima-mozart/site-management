class CreateEvents < ActiveRecord::Migration[6.0]
  def change
    create_table :events do |t|
      t.string :title, null: false
      t.date :start_day, null: false
      t.date :end_day
      t.text :memo
      t.references :business, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
