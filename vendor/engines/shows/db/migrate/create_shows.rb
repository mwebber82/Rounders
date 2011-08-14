class CreateShows < ActiveRecord::Migration

  def self.up
    create_table :shows do |t|
      t.string :Title
      t.datetime :Date
      t.text :OtherBands
      t.integer :Thumbnail_id
      t.string :Details
      t.string :Location
      t.string :Street
      t.string :City
      t.string :Province
      t.string :Zip
      t.string :Country
      t.string :Phone
      t.string :Website
      t.string :Admission
      t.integer :position

      t.timestamps
    end

    add_index :shows, :id

    load(Rails.root.join('db', 'seeds', 'shows.rb'))
  end

  def self.down
    UserPlugin.destroy_all({:name => "shows"})

    Page.delete_all({:link_url => "/shows"})

    drop_table :shows
  end

end
