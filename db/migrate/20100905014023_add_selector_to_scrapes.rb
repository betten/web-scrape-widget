class AddSelectorToScrapes < ActiveRecord::Migration
  def self.up
    add_column :scrapes, :selector, :string
  end

  def self.down
    remove_column :scrapes, :selector
  end
end
