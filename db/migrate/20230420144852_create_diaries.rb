class CreateDiaries < ActiveRecord::Migration[6.0]
  def change
    create_table :diaries do |t|
      t.date :posted_date, null: false
      t.string :happy, null: false
      t.text :diary
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
