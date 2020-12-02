class CreateEvents < ActiveRecord::Migration[6.0]
  def change
    create_table :events do |t|
      t.string :title, null: false
      t.date :start, null: false
      t.date :end

      t.timestamps
    end
  end
end
