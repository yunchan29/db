Table category {
  ca_id int [primary key, auto increment]
  category_name varchar(222) [not null]
  date_created_at datetime [not null, default: 'CURRENT_TIMESTAMP']
  date_updated_at datetime [not null, default: 'CURRENT_TIMESTAMP', on update: 'CURRENT_TIMESTAMP']
}

Table product {
  pr_id int [primary key, auto increment]
  ca_id char(10) [not null]
  product_name varchar(222) [not null]
  category varchar(222) [not null]
  selling_price decimal(10,2)
  image varchar(222) [not null]
  date_created_at datetime [not null]
  date_updated_at datetime [not null]
}

Table material {
  ma_id int [primary key, auto increment]
  material_name varchar(222) [not null]
  type varchar(222) [not null]
  stock int [not null]
  enter_stock int [not null]
  unit varchar(222) [not null]
  remarks varchar(222) [not null]
  comment varchar(222) [not null]
  image varchar(222) [not null]
  date_created_at datetime [not null]
  date_updated_at datetime [not null]
}

Table supplier {
  su_id int [primary key, auto increment]
  ma_id int [not null]
  date_created_at datetime [not null]
  date_updated_at datetime [not null]
}

Table delivery {
  delivery_id int [primary key, auto increment]
  su_id int [not null]
  delivery_date datetime [not null]
  delivery_status varchar(50) [not null]
  total_items int [default: 0]
  shop_location varchar(100) [not null]
}

Table sale {
  sa_id int [primary key, auto increment]
  pr_id int [not null]
  sales_code int [not null]
  sell_price decimal(10,2)
  quantity int [not null]
  total decimal(10,2) [not null]
  status varchar(255) [not null]
  date_created_at datetime [not null]
  date_updated_at datetime [not null]
}

Table supplier_material {
  sm_id int [primary key]
  material_name varchar(222) [not null]
  type varchar(222) [not null]
  stock int [not null]
  enter_stock int [not null]
  selling_price decimal(10,2)
  unit varchar(222) [not null]
  remarks varchar(222) [not null]
  comment varchar(222) [not null]
  image varchar(222) [not null]
  user_id int [not null]
  date_created_at datetime [not null]
  date_updated_at datetime [not null]
}

Table supplier_history {
  sh_id int [primary key]
  material_name varchar(222) [not null]
  type varchar(222) [not null]
  stock int [not null]
  enter_stock int [not null]
  selling_price decimal(10,2)
  unit varchar(222) [not null]
  remarks varchar(222) [not null]
  user_id int [not null]
  date_created_at datetime [not null]
  date_updated_at datetime [not null]
}

Table cart {
  ct_id int [primary key]
  sm_id int [not null]
  cart_code varchar(222) [not null]
  sell_price decimal(10,2)
  quantity int [not null]
  total int [not null]
  user_id int [not null]
  date_created_at datetime [not null]
  date_updated_at datetime [not null]
}

Ref: product.ca_id > category.ca_id
Ref: supplier.ma_id > material.ma_id
Ref: delivery.su_id > supplier.su_id
Ref: sale.pr_id > product.pr_id

Ref: cart.sm_id > supplier_material.sm_id
Ref: cart.user_id > users.user_id
Ref: supplier_material.user_id > users.user_id
Ref: supplier_history.user_id > users.user_id
