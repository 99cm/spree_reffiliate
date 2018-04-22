class AddStoreCreditReferenceToReferredRecord < ActiveRecord::Migration[5.1]
  def change
    add_reference :spree_referred_records, :store_credit, index: true
  end
end
