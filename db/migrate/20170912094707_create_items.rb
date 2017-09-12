class CreateItems < ActiveRecord::Migration[5.1]
  def change
    create_table :items do |t|
      t.text :name, null: false
      t.boolean :done, null: false, default: false
      t.integer :position, null: false

      t.timestamps
    end
  end
end
