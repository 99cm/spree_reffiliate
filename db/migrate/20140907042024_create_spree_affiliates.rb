class CreateSpreeAffiliates < ActiveRecord::Migration[5.1]
  def change
    create_table :spree_affiliates do |t|
      t.string :name
      t.string :path
      t.string :partial
    end
  end
end
