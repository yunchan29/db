// Use DBML to define your database structure
// Docs: https://dbml.dbdiagram.io/docs

Table users {
  user_id int [primary key, note: 'Auto increment']
  username varchar(225)
  firstname varchar(225)
  lastname varchar(225)
  email varchar(225)
  phone varchar(225)
  address varchar(225)
  age varchar(225)
  birthday date
  start_date date
  password varchar(225)
  role varchar(225) [note: 'Admin, Cashier, Employee, Supplier']
  about varchar(225)
  image varchar(225)
  signature varchar(225)
  session_attempt int
  code varchar(225)
  time varchar(225)
  status varchar(225)
  date_created_at datetime
  date_updated_at datetime
}

Table loginhistory {
  log_id int [primary key, note: 'Auto increment']
  user_id int
  date_created_at datetime
}

Table category {
  ca_id char(10) [primary key]
  category_name varchar(222)
  date_created_at datetime [default: 'CURRENT_TIMESTAMP']
  date_updated_at datetime [default: 'CURRENT_TIMESTAMP']
}

Table product {
  pr_id varchar(255) [primary key]
  ca_id char(10)
  product_name varchar(222)
  category varchar(222)
  selling_price decimal(10,2)
  image varchar(222)
  date_created_at datetime
  date_updated_at datetime
}

Table material {
  ma_id char(10) [primary key]
  material_name varchar(222)
  type varchar(222)
  stock int(222)
  enter_stock int(222)
  unit varchar(222)
  remarks varchar(222)
  comment varchar(222)
  image varchar(222)
  date_created_at datetime
  date_updated_at datetime
}

Table inventory {
  in_id int [primary key, note: 'Auto increment']
  ma_id int
  date_created_at datetime
  date_updated_at datetime
}

Table menu {
  me_id int [primary key, note: 'Auto increment']
  pr_id int
  ma_id int
  date_created_at datetime
  date_updated_at datetime
}

Table history {
  ar_id int [primary key, note: 'Auto increment']
  material_name varchar(222)
  type varchar(222)
  stock int
  enter_stock int
  unit varchar(222)
  remarks varchar(222)
  date_created_at datetime
  date_updated_at datetime
}

Table sale {
  sa_id int [primary key, note: 'Auto increment']
  pr_id varchar(255)
  sales_code int
  sell_price decimal(10,2)
  quantity int
  total decimal(10,2)
  status varchar(255)
  date_created_at datetime
  date_updated_at datetime
}

Table supplier {
  su_id int [primary key, note: 'Auto increment']
  ma_id int
  date_created_at datetime
  date_updated_at datetime
}

Ref: product.ca_id > category.ca_id
Ref: loginhistory.user_id > users.user_id
Ref: inventory.ma_id > material.ma_id
Ref: menu.pr_id > product.pr_id
Ref: menu.ma_id > material.ma_id
Ref: sale.pr_id > product.pr_id
Ref: supplier.ma_id > material.ma_id
