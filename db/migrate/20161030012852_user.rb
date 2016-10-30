class User < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :username
      t.string :email, index: true
      t.string :password

      t.timestamps
    end
  end
end
