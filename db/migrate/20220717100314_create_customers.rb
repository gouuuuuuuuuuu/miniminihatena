class CreateCustomers < ActiveRecord::Migration[6.1]
  def change
    create_table :customers do |t|

      t.timestamps
      t.string :last_name
       t.string :first_name
        t.string :last_name_kana
         t.string :first_name_kana
          t.string :email
           t.boolean :is_deleted
            t.string :encrypted_password
             t.string :postal_code
              t.string :address
               t.string :telephone_number

    end
  end
end
