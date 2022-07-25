class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|

      t.timestamps
       t.string :last_name
        t.string :first_name
         t.string :last_name_kana
          t.string :first_name_kana
    end
  end
end
