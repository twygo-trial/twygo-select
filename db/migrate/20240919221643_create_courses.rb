class CreateCourses < ActiveRecord::Migration[7.2]
  def change
    create_table :courses do |t|
      t.string :title
      t.text :description
      t.date :end_date
      t.integer :video_size, default: 0  # Set default value to 0

      t.timestamps
    end
  end
end
