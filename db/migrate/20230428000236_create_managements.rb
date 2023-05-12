class CreateManagements < ActiveRecord::Migration[6.0]
  def change
    create_table :managements do |t|
      t.datetime :start_time, null: false
      t.integer :record_id, null: false
      t.string  :note
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
