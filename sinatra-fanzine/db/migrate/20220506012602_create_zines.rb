class CreateZines < ActiveRecord::Migration[6.0]
  def change
    create_table :zines do |t|
      t.string :title
      t.string :author
      t.string :content
      t.integer :user_id
    end
  end
end
