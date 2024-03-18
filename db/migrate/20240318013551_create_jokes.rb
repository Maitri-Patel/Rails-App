class CreateJokes < ActiveRecord::Migration[7.1]
  def change
    create_table :jokes do |t|
      t.text :setup
      t.text :punchline

      t.timestamps
    end
  end
end
