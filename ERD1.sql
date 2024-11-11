Table users {
  user_id integer [primary key, increment]
  username varchar(225)
  firstname varchar(225)
  lastname varchar(225)
  email varchar(225)
  phone varchar(225)
  address varchar(225)
  birthday date
  password varchar(225)
  role varchar(225) [note: 'Admin, Employee, Delivery Person']
  image varchar(225)
  signature varchar(225)
  session_attempt integer
  code varchar(225)
  time varchar(225)
  status varchar(225)
  created_by integer
  updated_by integer
  date_created_at datetime
}

Table loginhistory {
  log_id integer [primary key, increment]
  user_id integer
  date_created_at datetime
}

Ref: loginhistory.user_id > users.user_id

Table inventory {
  in_id integer [primary key, increment]
  pr_id integer
  item_code varchar(222)
  sell_price decimal(10, 2)
  quantity integer
  expiration_date date
  remarks varchar(222)
  created_by integer
  updated_by integer
  date_created_at datetime
  date_updated_at datetime
}

Table archive {
  ar_id integer [primary key, increment]
  pr_id integer
  item_code varchar(222)
  sell_price decimal(10, 2)
  quantity integer
  expiration_date date
  remarks varchar(222)
  created_by integer
  updated_by integer
  date_created_at datetime
  date_updated_at datetime
}

Table category {
  ca_id integer [primary key, increment]
  category_name varchar(222)
  date_created_at datetime [default: 'CURRENT_TIMESTAMP']
  date_updated_at datetime [default: 'CURRENT_TIMESTAMP']
}

Table product {
  pr_id integer [primary key, increment]
  ca_id char(10)
  product_name varchar(222)
  category varchar(222)
  selling_price decimal(10, 2)
  image varchar(222)
  date_created_at datetime
  date_updated_at datetime
}

Ref: product.ca_id > category.ca_id

Table material {
  ma_id integer [primary key, increment]
  material_name varchar(222)
  type varchar(222)
  stock integer
  enter_stock integer
  unit varchar(222)
  remarks varchar(222)
  comment varchar(222)
  image varchar(222)
  date_created_at datetime
  date_updated_at datetime
}

Table supplier {
  su_id integer [primary key, increment]
  ma_id integer
  date_created_at datetime
  date_updated_at datetime
}

Ref: supplier.ma_id > material.ma_id

Table delivery {
  delivery_id integer [primary key, increment]
  su_id integer
  delivery_date datetime
  delivery_status varchar(50)
  total_items integer [default: 0]
  shop_location varchar(100)
}

Ref: delivery.su_id > supplier.su_id

Table sale {
  sa_id integer [primary key, increment]
  pr_id integer
  sales_code integer
  sell_price decimal(10, 2)
  quantity integer
  total decimal(10, 2)
  status varchar(255)
  date_created_at datetime
  date_updated_at datetime
}

Table cart {
  ct_id integer [primary key]
  sm_id integer
  cart_code varchar(222)
  sell_price decimal(10, 2)
  quantity integer
  total integer
  user_id integer
  date_created_at datetime
  date_updated_at datetime
}

Table supplier_history {
  sh_id integer [primary key]
  material_name varchar(222)
  type varchar(222)
  stock integer
  enter_stock integer
  selling_price decimal(10, 2)
  unit varchar(222)
  remarks varchar(222)
  user_id integer
  date_created_at datetime
  date_updated_at datetime
}

Table supplier_material {
  sm_id integer [primary key]
  material_name varchar(222)
  type varchar(222)
  stock integer
  enter_stock integer
  selling_price decimal(10, 2)
  unit varchar(222)
  remarks varchar(222)
  comment varchar(222)
  image varchar(222)
  user_id integer
  date_created_at datetime
  date_updated_at datetime
}

Ref: sale.pr_id > product.pr_id
Ref: cart.sm_id > supplier_material.sm_id
Ref: cart.user_id > users.user_id
Ref: supplier_history.user_id > users.user_id
Ref: supplier_material.user_id > users.user_id
Ref: inventory.pr_id > product.pr_id
Ref: archive.pr_id > product.pr_id

Ref: "material"."ma_id" < "material"."stock"
