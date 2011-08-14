class CreateBios < ActiveRecord::Migration

  def self.up
    create_table :bios do |t|
      t.string :Name
      t.string :Instruments
      t.text :Details
      t.integer :Image_id
      t.string :Facebook
      t.string :Email
      t.integer :position

      t.timestamps
    end

    add_index :bios, :id

    load(Rails.root.join('db', 'seeds', 'bios.rb'))
  end

  def self.down
    UserPlugin.destroy_all({:name => "bios"})

    Page.delete_all({:link_url => "/bios"})

    drop_table :bios
  end

end
