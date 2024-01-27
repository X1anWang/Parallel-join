#!/bin/bash -x

cd ~/tpch/dbgen/;

rm *.tbl;
./dbgen -s 0.4;
python3 tran1.py 04;
python3 tran2.py 04;
python3 tran3.py 04;
python3 tran4.py 04;
mv test* ~/parallel-join/data/tpch/;

rm *.tbl;
./dbgen -s 0.5;
python3 tran1.py 05;
python3 tran2.py 05;
python3 tran3.py 05;
python3 tran4.py 05;
mv test* ~/parallel-join/data/tpch/;

rm *.tbl;
./dbgen -s 0.6;
python3 tran1.py 06;
python3 tran2.py 06;
python3 tran3.py 06;
python3 tran4.py 06;
mv test* ~/parallel-join/data/tpch/;

rm *.tbl;
./dbgen -s 0.7;
python3 tran1.py 07;
python3 tran2.py 07;
python3 tran3.py 07;
python3 tran4.py 07;
mv test* ~/parallel-join/data/tpch/;

rm *.tbl;
./dbgen -s 0.8;
python3 tran1.py 08;
python3 tran2.py 08;
python3 tran3.py 08;
python3 tran4.py 08;
mv test* ~/parallel-join/data/tpch/;

rm *.tbl;
./dbgen -s 0.9;
python3 tran1.py 09;
python3 tran2.py 09;
python3 tran3.py 09;
python3 tran4.py 09;
mv test* ~/parallel-join/data/tpch/;

rm *.tbl;
./dbgen -s 1;
python3 tran1.py 1;
python3 tran2.py 1;
python3 tran3.py 1;
python3 tran4.py 1;
mv test* ~/parallel-join/data/tpch/;

rm *.tbl;
./dbgen -s 1.1;
python3 tran1.py 11;
python3 tran2.py 11;
python3 tran3.py 11;
python3 tran4.py 11;
mv test* ~/parallel-join/data/tpch/;

rm *.tbl;
./dbgen -s 1.2;
python3 tran1.py 12;
python3 tran2.py 12;
python3 tran3.py 12;
python3 tran4.py 12;
mv test* ~/parallel-join/data/tpch/;

rm *.tbl;
./dbgen -s 1.3;
python3 tran1.py 13;
python3 tran2.py 13;
python3 tran3.py 13;
python3 tran4.py 13;
mv test* ~/parallel-join/data/tpch/;

rm *.tbl;
./dbgen -s 1.4;
python3 tran1.py 14;
python3 tran2.py 14;
python3 tran3.py 14;
python3 tran4.py 14;
mv test* ~/parallel-join/data/tpch/;

rm *.tbl;
./dbgen -s 1.5;
python3 tran1.py 15;
python3 tran2.py 15;
python3 tran3.py 15;
python3 tran4.py 15;
mv test* ~/parallel-join/data/tpch/;

rm *.tbl;
./dbgen -s 1.6;
python3 tran1.py 16;
python3 tran2.py 16;
python3 tran3.py 16;
python3 tran4.py 16;
mv test* ~/parallel-join/data/tpch/;

rm *.tbl;
./dbgen -s 1.7;
python3 tran1.py 17;
python3 tran2.py 17;
python3 tran3.py 17;
python3 tran4.py 17;
mv test* ~/parallel-join/data/tpch/;

rm *.tbl;
./dbgen -s 1.8;
python3 tran1.py 18;
python3 tran2.py 18;
python3 tran3.py 18;
python3 tran4.py 18;
mv test* ~/parallel-join/data/tpch/;

rm *.tbl;
./dbgen -s 1.9;
python3 tran1.py 19;
python3 tran2.py 19;
python3 tran3.py 19;
python3 tran4.py 19;
mv test* ~/parallel-join/data/tpch/;

rm *.tbl;
./dbgen -s 2;
python3 tran1.py 2;
python3 tran2.py 2;
python3 tran3.py 2;
python3 tran4.py 2;
mv test* ~/parallel-join/data/tpch/;

rm *.tbl;
rm test*;
./dbgen -s 4;
python3 tran4.py 4;
mv test* ~/parallel-join/data/tpch/;

rm *.tbl;
rm test*;
./dbgen -s 6;
python3 tran4.py 6;
mv test* ~/parallel-join/data/tpch/;

rm *.tbl;
rm test*;
./dbgen -s 8;
python3 tran4.py 8;
mv test* ~/parallel-join/data/tpch/;

rm *.tbl;
rm test*;
./dbgen -s 10;
python3 tran4.py 10;
mv test* ~/parallel-join/data/tpch/;
