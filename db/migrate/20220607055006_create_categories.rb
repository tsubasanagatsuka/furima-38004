class CreateCategories < ActiveRecord::Migration[6.0]
  def change
    create_table :categories do |t|
     t.string      :name              , null: false
     t.text        :description       , null: false
     t.integer     :category_id       , null: false
     t.integer     :state_id          , null: false
     t.integer     :delivery_burden_id, null: false
     t.integer     :prefecture_id     , null: false
     t.integer     :ship_day_id       , null: false
     t.integer     :price             , null: false
   
     t.timestamps
    end
  end
end
