class CreateAccounts < ActiveRecord::Migration[7.1]
  def change
    create_table :accounts do |t|
      t.string :username
      t.string :email
      t.string :password_digest
      t.string :unique_auth_id
      t.string :type

      t.timestamps
    end
  end
end
