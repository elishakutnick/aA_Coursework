class CreateShortenedurls < ActiveRecord::Migration[5.2]
  def change
    create_table :shortenedurls do |t|
      t.string :long_url, null:false
      t.string :short_url, null:false


      t.timestamps
    end
    add_index :shortenedurls, :short_url, unique: true
  end
end
