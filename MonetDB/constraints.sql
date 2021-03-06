ALTER TABLE region   ADD CONSTRAINT regionkey            PRIMARY KEY (r_regionkey)                                                         ;
ALTER TABLE nation   ADD CONSTRAINT nationkey            PRIMARY KEY (n_nationkey)                                                         ;
ALTER TABLE supplier ADD CONSTRAINT suppkey              PRIMARY KEY (s_suppkey)                                                           ;
ALTER TABLE customer ADD CONSTRAINT custkey              PRIMARY KEY (c_custkey)                                                           ;
ALTER TABLE part     ADD CONSTRAINT partkey              PRIMARY KEY (p_partkey)                                                           ;
ALTER TABLE partsupp ADD CONSTRAINT partsuppkey          PRIMARY KEY (ps_partkey, ps_suppkey)                                              ;
ALTER TABLE orders   ADD CONSTRAINT orderkey             PRIMARY KEY (o_orderkey)                                                          ;
ALTER TABLE lineitem ADD CONSTRAINT lineitemkey          PRIMARY KEY (l_orderkey,l_linenumber)                                             ;
ALTER TABLE nation   ADD CONSTRAINT nation_regionkey     FOREIGN KEY (n_regionkey)             REFERENCES region   (r_regionkey)           ;
ALTER TABLE supplier ADD CONSTRAINT supplier_nationkey   FOREIGN KEY (s_nationkey)             REFERENCES nation   (n_nationkey)           ;
ALTER TABLE customer ADD CONSTRAINT customer_nationkey   FOREIGN KEY (c_nationkey)             REFERENCES nation   (n_nationkey)           ;
ALTER TABLE partsupp ADD CONSTRAINT partsupp_partkey     FOREIGN KEY (ps_partkey)              REFERENCES part     (p_partkey)             ;
ALTER TABLE partsupp ADD CONSTRAINT partsupp_suppkey     FOREIGN KEY (ps_suppkey)              REFERENCES supplier (s_suppkey)             ;
ALTER TABLE orders   ADD CONSTRAINT order_custkey        FOREIGN KEY (o_custkey)               REFERENCES customer (c_custkey)             ;
ALTER TABLE lineitem ADD CONSTRAINT lineitem_orderkey    FOREIGN KEY (l_orderkey)              REFERENCES orders   (o_orderkey)            ;
ALTER TABLE lineitem ADD CONSTRAINT lineitem_partkey     FOREIGN KEY (l_partkey)               REFERENCES part     (p_partkey)             ;
ALTER TABLE lineitem ADD CONSTRAINT lineitem_suppkey     FOREIGN KEY (l_suppkey)               REFERENCES supplier (s_suppkey)             ;
ALTER TABLE lineitem ADD CONSTRAINT lineitem_partsuppkey FOREIGN KEY (l_partkey,l_suppkey)     REFERENCES partsupp (ps_partkey,ps_suppkey) ;