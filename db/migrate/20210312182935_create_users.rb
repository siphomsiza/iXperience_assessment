class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :first_name,               null: false, default: ""
      t.string :last_name,                null: false, default: ""
      t.string :email,                    null: false, default: ""
      t.string :password_digest,          null: false, default: ""
      t.date   :birthday,                 default: ""
      t.string :gender,                   default: ""
      t.string :university,               default: ""
      t.timestamps
    end
    add_index :users, :email, unique: true
  end
end
