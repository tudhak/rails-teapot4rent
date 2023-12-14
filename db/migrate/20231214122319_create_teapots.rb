class CreateTeapots < ActiveRecord::Migration[7.1]
  def change
    create_table :teapots do |t|
      t.string :style
      t.string :description
      t.float :price_per_day
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
