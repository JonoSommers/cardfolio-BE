class RenameTypeInCards < ActiveRecord::Migration[7.1]
  def change
    rename_column(:cards, :type, :category)
  end
end
