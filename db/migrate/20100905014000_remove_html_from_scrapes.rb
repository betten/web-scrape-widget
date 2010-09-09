class RemoveHtmlFromScrapes < ActiveRecord::Migration
  def self.up
    remove_column :scrapes, :html
  end

  def self.down
    add_column :scrapes, :html, :text
  end
end
