create_table :products, default_charset: :utf8mb4, row_format: :dynamic, collate: :utf8mb4_general_ci do |t|
  t.int :id, primary_key: true, extra: :auto_increment
  t.varchar :name
  t.decimal :price, precision: 8, scale: 2

  t.datetime :created_at
  t.datetime :updated_at
end

create_table :product_tags, default_charset: :utf8mb4, row_format: :dynamic, collate: :utf8mb4_general_ci do |t|
  t.int :id, primary_key: true, extra: :auto_increment
  t.int :product_id
  t.int :tag_id

  t.datetime :created_at
  t.datetime :updated_at
  t.foreign_key :product_id, reference: :products, reference_column: :id
  t.foreign_key :tag_id, reference: :tags, reference_column: :id
end

create_table :tags, default_charset: :utf8mb4, row_format: :dynamic, collate: :utf8mb4_general_ci do |t|
  t.int :id, primary_key: true, extra: :auto_increment
  t.varchar :name

  t.datetime :created_at
  t.datetime :updated_at
end

create_table :schema_migrations, default_charset: :utf8mb4, row_format: :dynamic, collate: :utf8mb4_general_ci do |t|
  t.varchar :version, limit: 191

  t.index :version, name: "unique_schema_migrations", unique: true
end

create_table :ar_internal_metadata, collate: :utf8_bin do |t|
  t.varchar :key
  t.varchar :value
  t.datetime :created_at
  t.datetime :updated_at
end
