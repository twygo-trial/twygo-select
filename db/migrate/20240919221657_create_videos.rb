class CreateVideos < ActiveRecord::Migration[7.2]
  def change
    create_table :videos do |t|
      t.integer :size
      t.references :course, null: false, foreign_key: true

      t.timestamps
    end
  end
end
