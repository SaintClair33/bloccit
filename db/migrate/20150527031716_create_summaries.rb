class CreateSummaries < ActiveRecord::Migration
  def change
    create_table :summaries do |t|
      t.string :body
      t.references :post
      t.timestamps
    end
  end
end
