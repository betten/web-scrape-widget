class CreateScrapes < ActiveRecord::Migration
  def self.up
    create_table :scrapes do |t|
      t.string :uid
      t.string :url
      t.text :html

      t.timestamps
    end
  end

  def self.down
    drop_table :scrapes
  end
end
