class ChangeColumnIn < ActiveRecord::Migration[7.0]
  def change
    change_column :items, :amount, :money, using: 'amount::numeric::money'
  end
end
