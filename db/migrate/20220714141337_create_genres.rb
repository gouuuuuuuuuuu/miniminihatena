class CreateGenres < ActiveRecord::Migration[6.1]
  def change
    create_table :genres do |t|

      t.timestamps
      t.string :name
      t.integer :customer_id
    end
  end
end
