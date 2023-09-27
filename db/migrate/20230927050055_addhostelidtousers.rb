class Addhostelidtousers < ActiveRecord::Migration[7.0]
  def change
    add_reference :users, :hostel, foreign_key: true
  end
end
