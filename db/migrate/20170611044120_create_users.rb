class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|

      t.timestamps
      t.string :name
      t.string :email
      t.string :expertise
      t.belongs_to :career
      t.text :description
      t.string :password_digest

    end
  end
end
