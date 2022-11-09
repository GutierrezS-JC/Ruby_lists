class CreateItems < ActiveRecord::Migration[7.0]
  def change
    create_table :items do |t|
      t.belongs_to :list, null: false, foreign_key: { on_delete: :cascade }
      t.string :description, null: false
      t.integer :quantity, null: false, default: 1
      t.boolean :completed, null: false, default: false

      t.timestamps
    end
  end
end
