class CreateOrderDates < ActiveRecord::Migration[6.0]
  def change
    create_table :order_dates do |t|

      t.timestamps
    end
  end
end
