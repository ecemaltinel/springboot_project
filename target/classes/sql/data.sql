insert into product(id, product_name, sales_price, production_date, availability) values(1, 'Computer', 1500 , parsedatetime('06.11.2019', 'dd.MM.yyyy'), '✔');
insert into product(id, product_name, sales_price, production_date, availability) values(2, 'PlayStation', 3200 , parsedatetime('05.11.2017', 'dd.MM.yyyy'), '✔');
insert into product(id, product_name, sales_price, production_date, availability) values(3, 'Laptop', 2500 , parsedatetime('08.09.2019', 'dd.MM.yyyy'), '✔');



insert into accessory(id, accessory_name,guarantee,productid) values(1, 'Keyboard','3 YEARS',1);
insert into accessory(id, accessory_name,guarantee, productid) values(2, 'Mouse','1 YEAR',1);
insert into accessory(id, accessory_name,guarantee, productid) values(3, 'Headphones','5 YEARS',3);

insert into accessory(id, accessory_name,guarantee,productid) values(4, 'Controller','3 YEARS',2);
insert into accessory(id, accessory_name,guarantee,productid) values(5, 'Memory Card','4 YEARS',2);
insert into accessory(id, accessory_name,guarantee,productid) values(6, 'USB','2 YEARS',3);

