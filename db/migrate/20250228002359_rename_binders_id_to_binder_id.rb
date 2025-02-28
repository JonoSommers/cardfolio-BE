class RenameBindersIdToBinderId < ActiveRecord::Migration[7.1]
  def change
    rename_column :binder_cards, :binders_id, :binder_id
  end
end
