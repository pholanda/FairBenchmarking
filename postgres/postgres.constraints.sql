-- TPCH integry constraints for postgres 9.x
-- hannes@cwi.nl, 2014-04-04

-- For table REGION
ALTER TABLE REGION ADD PRIMARY KEY (R_REGIONKEY);

-- For table NATION
ALTER TABLE NATION ADD PRIMARY KEY (N_NATIONKEY);
ALTER TABLE NATION ADD CONSTRAINT NATION_FK1 FOREIGN KEY (N_REGIONKEY) REFERENCES REGION;

-- For table PART
ALTER TABLE PART ADD PRIMARY KEY (P_PARTKEY);

-- For table SUPPLIER
ALTER TABLE SUPPLIER ADD PRIMARY KEY (S_SUPPKEY);
ALTER TABLE SUPPLIER ADD CONSTRAINT SUPPLIER_FK1 FOREIGN KEY (S_NATIONKEY) REFERENCES NATION;

-- For table PARTSUPP
ALTER TABLE PARTSUPP ADD PRIMARY KEY (PS_PARTKEY,PS_SUPPKEY);

-- For table CUSTOMER
ALTER TABLE CUSTOMER ADD PRIMARY KEY (C_CUSTKEY);
ALTER TABLE CUSTOMER ADD CONSTRAINT CUSTOMER_FK1 FOREIGN KEY (C_NATIONKEY) REFERENCES NATION;

-- For table LINEITEM
ALTER TABLE LINEITEM ADD PRIMARY KEY (L_ORDERKEY,L_LINENUMBER);

-- For table ORDERS
ALTER TABLE ORDERS ADD PRIMARY KEY (O_ORDERKEY);

-- For table PARTSUPP
ALTER TABLE PARTSUPP ADD CONSTRAINT PARTSUPP_FK1 FOREIGN KEY (PS_SUPPKEY) REFERENCES SUPPLIER;
ALTER TABLE PARTSUPP ADD CONSTRAINT PARTSUPP_FK2 FOREIGN KEY (PS_PARTKEY) REFERENCES PART;

-- For table ORDERS
ALTER TABLE ORDERS ADD CONSTRAINT ORDERS_FK1 FOREIGN KEY (O_CUSTKEY) REFERENCES CUSTOMER;

-- For table LINEITEM
ALTER TABLE LINEITEM ADD CONSTRAINT LINEITEM_FK1 FOREIGN KEY (L_ORDERKEY)  REFERENCES ORDERS;
ALTER TABLE LINEITEM ADD CONSTRAINT LINEITEM_FK2 FOREIGN KEY (L_PARTKEY,L_SUPPKEY) REFERENCES PARTSUPP;




