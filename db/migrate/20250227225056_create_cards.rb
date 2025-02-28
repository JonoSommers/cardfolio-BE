class CreateCards < ActiveRecord::Migration[7.1]
  def change
    create_table :cards do |t|
      t.string :name
      t.string :image_url
      t.integer :type

      t.timestamps
    end
  end
end
