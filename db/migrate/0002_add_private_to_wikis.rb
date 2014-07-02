class AddPrivateToWikis < ActiveRecord::Migration

  def self.up
    add_column(:wikis, "private", :boolean, :default => false)
  end

  def self.down
    remove_column(:wikis, "private")
  end
end
