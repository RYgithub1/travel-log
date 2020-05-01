class CreateAboutmes < ActiveRecord::Migration[5.0]

  def change

    create_table :aboutmes do |t|
      t.text :content
      t.string :image
      t.text :url
      # t.references :user, foreign_key: true
      t.timestamps

    end
  end
end
