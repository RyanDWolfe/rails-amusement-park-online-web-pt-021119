class CreateUser < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :name
      t.string :password_digest
      t.integer :happiness
      t.integer :nausea
      t.integer :height
      t.integer :tickets
    end
  end
end
