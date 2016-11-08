class AddAvatarToItems < ActiveRecord::Migration[5.0]
  def self.up
    add_attachment :items, :avatar
  end

  def self.down
    remove_attachment :items, :avatar
  end
end
