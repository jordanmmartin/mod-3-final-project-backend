class AddThingsToChannels < ActiveRecord::Migration[5.2]
  def change
    add_column :channels, :current_video_url, :string
    add_column :channels, :time, :float
    add_column :channels, :state, :integer
  end
end
