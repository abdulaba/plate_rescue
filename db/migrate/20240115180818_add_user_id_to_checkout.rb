class AddUserIdToCheckout < ActiveRecord::Migration[7.1]
  def change
    add_reference :checkouts, :user, foreign_key: true
  end
end
