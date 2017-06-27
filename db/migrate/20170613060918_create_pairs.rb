class CreatePairs < ActiveRecord::Migration[5.1]
  def change
    create_table :pairs do |t|

      t.timestamps
      t.belongs_to :user
      t.integer :mentee_id
      t.string :message

    end
  end
end
