class CreateBinderCards < ActiveRecord::Migration[7.1]
  def change
    create_table :binder_cards do |t|
      t.references :binders, null: false, foreign_key: true
      t.references :card, null: false, foreign_key: true
      t.boolean :favorite

      t.timestamps
    end
  end
end
