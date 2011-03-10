class CreateWidgets < ActiveRecord::Migration

  def self.up
    create_table :widgets do |t|
      t.references :user_plugin
      t.integer :position

      t.timestamps
    end

    add_index :widgets, :id

    load(Rails.root.join('db', 'seeds', 'widgets.rb'))
  end

  def self.down
    UserPlugin.destroy_all({:name => "widgets"})

    Page.delete_all({:link_url => "/widgets"})

    drop_table :widgets
  end

end
