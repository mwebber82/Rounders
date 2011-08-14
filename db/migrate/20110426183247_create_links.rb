class CreateLinks < ActiveRecord::Migration

  def self.up
    create_table :links do |t|
      t.string :Title
      t.string :Url
      t.integer :position

      t.timestamps
    end

    add_index :links, :id

    load(Rails.root.join('db', 'seeds', 'links.rb'))
  end

  def self.down
    UserPlugin.destroy_all({:name => "links"})

    Page.delete_all({:link_url => "/links"})

    drop_table :links
  end

end
