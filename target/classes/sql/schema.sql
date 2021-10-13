create table product(id identity primary key, product_name varchar(100), sales_price float, production_date date, availability varchar(15));
					
create table accessory(id identity primary key, 
                        accessory_name varchar(50),
                        guarantee varchar(10),
                        productid bigint, foreign key(productid) references product(id));

