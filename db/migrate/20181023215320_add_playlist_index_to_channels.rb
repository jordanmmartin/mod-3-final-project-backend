class AddPlaylistIndexToChannels < ActiveRecord::Migration[5.2]
  def change
    add_column :channels, :playlist_index, :integer
  end
end
