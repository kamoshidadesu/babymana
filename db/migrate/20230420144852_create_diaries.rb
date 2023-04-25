class CreateDiaries < ActiveRecord::Migration[6.0]
  def change
    create_table :diaries do |t|
      t.datetime :start_time, null: false
      t.string :happy, null: false
      t.string :diary
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
