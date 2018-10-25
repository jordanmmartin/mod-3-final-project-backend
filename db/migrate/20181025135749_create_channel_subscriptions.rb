class CreateChannelSubscriptions < ActiveRecord::Migration[5.2]
  def change
    create_table :channel_subscriptions do |t|
      t.integer :user_id
      t.integer :channel_id

      t.timestamps
    end
  end
end
