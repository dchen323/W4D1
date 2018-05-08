class DropTestings < ActiveRecord::Migration[5.1]
  def change
    drop_table :testings
  end
end
