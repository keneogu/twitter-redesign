class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :username, null: false, default: ''
      t.string :fullname, null: false, default: ''
      t.string :photo
      t.string :cover_image

      t.timestamps
    end
  end
end
