class CreateMarkers < ActiveRecord::Migration[6.0]
  def change
    create_table :markers do |t|
      t.string :name, null: false
      t.string :name_cad, null: false
      t.integer :type_id, null: false
      t.integer :exist_id, null: false
      t.references :site , null:false, foreign_key: true

      t.timestamps
    end
  end
end
