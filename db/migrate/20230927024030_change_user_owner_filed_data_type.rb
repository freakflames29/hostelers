class ChangeUserOwnerFiledDataType < ActiveRecord::Migration[7.0]
  def change
    change_column :users,:owner,:boolean
  end
end
