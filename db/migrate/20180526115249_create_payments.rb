class CreatePayments < ActiveRecord::Migration[5.2]
  def change
    create_table :payments do |t|
      t.references :booking, foreign_key: true
      t.decimal :amount
      t.string :status
      t.datetime :paid_at

      t.timestamps
    end
  end
end
