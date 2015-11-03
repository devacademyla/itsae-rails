class CreateProductos < ActiveRecord::Migration
  def change
    create_table :productos do |t|
      t.string :titulo
      t.text :descripcion
      t.decimal :precio

      t.timestamps null: false
    end
  end
end
