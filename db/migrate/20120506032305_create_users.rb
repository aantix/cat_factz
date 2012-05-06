class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :phonenumber

      t.timestamps
    end
  end
end
