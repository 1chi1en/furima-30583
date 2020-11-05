class CreateBuyers < ActiveRecord::Migration[6.0]
  def change
    create_table :buyers do |t|
      t.string     :post_code,  null: false
      t.integer    :pref_id,    null: false
      t.string     :town,       null: false
      t.string     :address,    null: false
      t.string     :residence_name
      t.string     :phone,      null: false
      t.references :purchase,   null: false, foreign_key: true
      t.timestamps
    end
  end
end
