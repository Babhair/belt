class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :fn
      t.string :ls
      t.string :email
      t.string :city
      t.string :state
      t.string :password_digest

      t.timestamps
    end
  end
end
