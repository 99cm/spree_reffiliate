class CreateSpreeCommissionRules < ActiveRecord::Migration[5.1]
  def change
    create_table :spree_commission_rules do |t|
      t.string :name
      t.text :description
      t.boolean :fixed_commission, null: false

      t.timestamps null: false
    end
  end
end
