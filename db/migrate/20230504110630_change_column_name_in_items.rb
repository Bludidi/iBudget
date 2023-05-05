class ChangeColumnNameInItems < ActiveRecord::Migration[7.0]
  def change
    change_column :items, :amount, :float, using: 'amount::numeric::float'
  end
end
