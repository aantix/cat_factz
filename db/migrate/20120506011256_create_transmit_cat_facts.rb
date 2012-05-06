class CreateTransmitCatFacts < ActiveRecord::Migration
  def change
    create_table :transmit_cat_facts do |t|
      t.string :phonenumber
      t.string :message
      t.string :sentreceived

      t.timestamps
    end
  end
end
