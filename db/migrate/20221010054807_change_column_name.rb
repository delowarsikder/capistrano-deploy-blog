class ChangeColumnName < ActiveRecord::Migration[7.0]
  def change
    rename_column :articles, :titile, :title
  end
end
