class CreateWords < ActiveRecord::Migration[6.1]
  def change
    create_table :words do |t|
      t.references :user, null: false, foreign_key: true
      t.string :word, null: false
      t.text :memo
      t.boolean :archive, null: false, default: true

      t.timestamps
    end
  end
end
