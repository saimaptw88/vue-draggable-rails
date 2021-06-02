class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :name
      t.integer :categoryNo
      t.integer :index

      t.timestamps
    end
  end
end
