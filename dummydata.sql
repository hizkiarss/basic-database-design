INSERT INTO public."user" (username,userpassword,useraddress,useremail) VALUES
	 ('boi','boiboiboi','hangkasturi','boiohboi@gmail.com'),
	 ('boi2','boiboiboi2','hangkasturi2','boiohboi2@gmail.com');


INSERT INTO public.merchant (userid,merchantname) VALUES
	 (2,'COC Komputer');


INSERT INTO public.product (productname,productweight,productprice) VALUES
	 ('asus rog wuih mantab',13,16000000);


INSERT INTO public.insurance (insurancename) VALUES
	 ('jiwasraya mantab');


INSERT INTO public.items (productid,insuranceid,itemsquantity,itemstotalprice,insurancefee) VALUES
	 (2,2,13,960000,96000);


INSERT INTO public.shipment (shipmentcourier,shipmentinsurance,shipmentprice) VALUES
	 ('sifast','mantabpastisampai',1500000);

INSERT INTO public.payment (paymentmethod) VALUES
	 ('mandiri');

INSERT INTO public.promo (promoname,promodiscount) VALUES
	 ('diskonmantabmantab',500000);

INSERT INTO public."order" (merchantid,userid,shipmentid,promoid,invoiceid,applicationfee,servicefee,buyingdate,paymentid,itemsid) VALUES
	 (2,2,1,1,'2004/XMV/137',1000,1000,'2204-12-04',1,17);

