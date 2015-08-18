class CreateSummaries < ActiveRecord::Migration
  def change
    create_table :summaries do |t|
      t.string :post_id
      t.text :body

      t.timestamps null: false
    end
    add_index :summaries, :post_id
  end
end
