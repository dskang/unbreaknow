class CreateBugs < ActiveRecord::Migration
  def change
    create_table :bugs do |t|
      t.string :service_twitter
      t.string :short_description
      t.text :long_description

      t.timestamps
    end
  end
end
