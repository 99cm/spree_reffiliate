class AddLayoutToSpreeAffiliate < ActiveRecord::Migration[5.1]
  def change
    add_column :spree_affiliates, :layout, :string
  end
end
