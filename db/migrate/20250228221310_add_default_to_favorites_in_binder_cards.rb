class AddDefaultToFavoritesInBinderCards < ActiveRecord::Migration[7.1]
  def change
    change_column_default :binder_cards, :favorite, false
  end
end
