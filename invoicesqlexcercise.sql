-- public."user" definition

-- Drop table

-- DROP TABLE public."user";

CREATE TABLE public."user" (
	username varchar NOT NULL,
	userid serial4 NOT NULL,
	userpassword varchar NOT NULL,
	useraddress varchar NOT NULL,
	useremail varchar NOT NULL,
	CONSTRAINT user_pk PRIMARY KEY (userid),
	CONSTRAINT user_unique UNIQUE (username)
);


-- public.product definition

-- Drop table

-- DROP TABLE public.product;

CREATE TABLE public.product (
	productid serial4 NOT NULL,
	productname varchar NOT NULL,
	productweight int4 NOT NULL,
	productprice int4 NOT NULL,
	CONSTRAINT product_pk PRIMARY KEY (productid),
	CONSTRAINT product_unique UNIQUE (productname)
);


-- public.insurance definition

-- Drop table

-- DROP TABLE public.insurance;

CREATE TABLE public.insurance (
	insuranceid serial4 NOT NULL,
	insurancename varchar NOT NULL,
	CONSTRAINT insurance_pk PRIMARY KEY (insuranceid),
	CONSTRAINT insurance_unique UNIQUE (insurancename)
);


-- public.shipment definition

-- Drop table

-- DROP TABLE public.shipment;

CREATE TABLE public.shipment (
	shipmentid serial4 NOT NULL,
	shipmentcourier varchar NOT NULL,
	shipmentinsurance varchar NOT NULL,
	shipmentprice numeric NOT NULL,
	CONSTRAINT shipment_pk PRIMARY KEY (shipmentid),
	CONSTRAINT shipment_unique UNIQUE (shipmentcourier),
	CONSTRAINT shipment_unique_1 UNIQUE (shipmentinsurance)
);


-- public.payment definition

-- Drop table

-- DROP TABLE public.payment;

CREATE TABLE public.payment (
	paymentid serial4 NOT NULL,
	paymentmethod varchar NOT NULL,
	CONSTRAINT payment_pk PRIMARY KEY (paymentid),
	CONSTRAINT payment_unique UNIQUE (paymentmethod)
);


-- public.promo definition

-- Drop table

-- DROP TABLE public.promo;

CREATE TABLE public.promo (
	promoid serial4 NOT NULL,
	promoname varchar NOT NULL,
	promodiscount int4 NOT NULL,
	CONSTRAINT promo_pk PRIMARY KEY (promoid)
);


-- public.merchant definition

-- Drop table

-- DROP TABLE public.merchant;

CREATE TABLE public.merchant (
	userid int4 NOT NULL,
	merchantname varchar NOT NULL,
	merchantid serial4 NOT NULL,
	CONSTRAINT merchant_pk PRIMARY KEY (merchantid),
	CONSTRAINT merchant_user_fk FOREIGN KEY (userid) REFERENCES public."user"(userid) ON DELETE CASCADE
);


-- public.items definition

-- Drop table

-- DROP TABLE public.items;

CREATE TABLE public.items (
	itemsid serial4 NOT NULL,
	productid int4 NOT NULL,
	insuranceid int4 NULL,
	itemsquantity int4 NOT NULL,
	itemstotalprice int4 NOT NULL,
	insurancefee int4 NULL,
	CONSTRAINT items_pk PRIMARY KEY (itemsid),
	CONSTRAINT items_unique UNIQUE (productid),
	CONSTRAINT items_insurance_fk FOREIGN KEY (insuranceid) REFERENCES public.insurance(insuranceid) ON DELETE CASCADE,
	CONSTRAINT items_product_fk FOREIGN KEY (productid) REFERENCES public.product(productid) ON DELETE CASCADE
);


-- public."order" definition

-- Drop table

-- DROP TABLE public."order";

CREATE TABLE public."order" (
	orderid serial4 NOT NULL,
	merchantid int4 NOT NULL,
	userid int4 NOT NULL,
	itemsid int4 NOT NULL,
	shipmentid int4 NOT NULL,
	promoid int4 NULL,
	invoiceid varchar NOT NULL,
	applicationfee int4 NOT NULL,
	servicefee int4 NOT NULL,
	buyingdate date NULL,
	paymentid int4 NOT NULL,
	CONSTRAINT order_pk PRIMARY KEY (orderid),
	CONSTRAINT order_unique UNIQUE (merchantid),
	CONSTRAINT order_unique_1 UNIQUE (userid),
	CONSTRAINT order_unique_2 UNIQUE (itemsid),
	CONSTRAINT order_unique_3 UNIQUE (shipmentid),
	CONSTRAINT order_unique_4 UNIQUE (invoiceid),
	CONSTRAINT order_unique_5 UNIQUE (paymentid),
	CONSTRAINT order_items_fk FOREIGN KEY (itemsid) REFERENCES public.items(itemsid),
	CONSTRAINT order_merchant_fk FOREIGN KEY (merchantid) REFERENCES public.merchant(merchantid),
	CONSTRAINT order_payment_fk FOREIGN KEY (paymentid) REFERENCES public.payment(paymentid) ON DELETE CASCADE ON UPDATE CASCADE,
	CONSTRAINT order_promo_fk FOREIGN KEY (promoid) REFERENCES public.promo(promoid),
	CONSTRAINT order_shipment_fk FOREIGN KEY (shipmentid) REFERENCES public.shipment(shipmentid),
	CONSTRAINT order_user_fk FOREIGN KEY (userid) REFERENCES public."user"(userid)
);