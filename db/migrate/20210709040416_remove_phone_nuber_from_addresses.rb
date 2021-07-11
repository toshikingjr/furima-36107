class RemovePhoneNuberFromAddresses < ActiveRecord::Migration[6.0]
  def change
    remove_column :addresses, :phone_nuber, :integer
  end
end
