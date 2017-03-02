class CreateSolds < ActiveRecord::Migration[5.0]
  def change
    create_table :solds do |t|
      t.references :user, foreign_key: true
      t.references :product, foreign_key: true
      t.string :name
      t.integer :amount

      t.timestamps
    end
  end
end
