class AddIndexToSpreeReferrals < ActiveRecord::Migration[5.1]
  def change
    add_index :spree_referrals, :user_id
  end
end
