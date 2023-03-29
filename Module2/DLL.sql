CREATE TABLE category (
	category_id serial4 NOT NULL,
	category_name varchar(20) NULL,
	CONSTRAINT category_pk PRIMARY KEY (category_id)
);


CREATE TABLE city (
	city_id serial4 NOT NULL,
	city_name varchar(17) NULL,
	zip_code numeric(5) NULL DEFAULT 0,
	state_id serial4 NOT NULL,
	CONSTRAINT city_pkey PRIMARY KEY (city_id)
);


CREATE TABLE customer (
	customer_id varchar(10) NOT NULL DEFAULT nextval('customer_customer_id_seq'::regclass),
	customer_name varchar(22) NULL,
	segment_id serial4 NOT NULL,
	CONSTRAINT customer_pkey PRIMARY KEY (customer_id)
);


CREATE TABLE order_table (
	order_table_id serial4 NOT NULL,
	order_date date NULL,
	ship_date date NULL,
	ship_mode_id serial4 NOT NULL,
	order_ident varchar(15) NULL,
	CONSTRAINT order_table_pkey PRIMARY KEY (order_table_id)
);


DROP TABLE people;
CREATE TABLE people (
	person varchar(17) NOT NULL,
	region_id serial4 NOT NULL,
	people_id serial4 NOT NULL,
	CONSTRAINT people_pk PRIMARY KEY (people_id)
);


CREATE TABLE region (
	region_id serial4 NOT NULL,
	region_name varchar(7) NULL,
	CONSTRAINT region_pkey PRIMARY KEY (region_id)
);


CREATE TABLE segment (
	segment_id serial4 NOT NULL,
	segment_name varchar(11) NULL,
	CONSTRAINT segment_pkey PRIMARY KEY (segment_id)
);


CREATE TABLE state (
	state_id serial4 NOT NULL,
	state_name varchar(20) NULL,
	region_id serial4 NOT NULL,
	CONSTRAINT state_pkey PRIMARY KEY (state_id)
);


CREATE TABLE subcategory (
	subcategory_id serial4 NOT NULL,
	subcategory_name varchar(20) NULL,
	category_id serial4 NOT NULL,
	CONSTRAINT subcategory_pk PRIMARY KEY (subcategory_id)
);


CREATE TABLE ship_mode (
	ship_mode_id serial4 NOT NULL,
	ship_mode_name varchar(20) NULL,
	CONSTRAINT ship_mode_pk PRIMARY KEY (ship_mode_id)
);


CREATE TABLE product (
	product_name varchar(150) NULL,
	product_ident varchar(20) NULL,
	subcategory_id serial4 NOT NULL,
	product_id serial4 NOT NULL,
	CONSTRAINT product_pk PRIMARY KEY (product_id)
);



CREATE TABLE main_orders (
	row_id serial4 NOT NULL,
	order_table_id serial4 NOT NULL,
	customer_id varchar(10) NOT NULL DEFAULT nextval('main_orders_customer_id_seq'::regclass),
	segment_id serial4 NOT NULL,
	country varchar(13) NOT NULL DEFAULT 'United States'::character varying,
	city_id serial4 NOT NULL,
	product_id serial4 NOT NULL,
	sales numeric(9, 4) NOT NULL,
	quantity int4 NOT NULL,
	discount numeric(4, 2) NOT NULL,
	profit numeric(21, 16) NOT NULL,
	people_id serial4 NOT NULL,
	CONSTRAINT main_orders_pk PRIMARY KEY (row_id)
);


