#!/bin/bash -x

cp ~/Parallel-join/new_* ~/tpch/dbgen/;

cd ~/tpch/dbgen/;

rm *.tbl;
./dbgen -s 2 -f;
python3 new_cu.py 11;
python3 new_su.py 11;
python3 new_tran1.py 11;
python3 new_tran2.py 11;
python3 new_tran3.py 11;

python3 new_cu.py 12;
python3 new_su.py 12;
python3 new_tran1.py 12;
python3 new_tran2.py 12;
python3 new_tran3.py 12;

python3 new_cu.py 13;
python3 new_su.py 13;
python3 new_tran1.py 13;
python3 new_tran2.py 13;
python3 new_tran3.py 13;

python3 new_cu.py 14;
python3 new_su.py 14;
python3 new_tran1.py 14;
python3 new_tran2.py 14;
python3 new_tran3.py 14;

python3 new_cu.py 15;
python3 new_su.py 15;
python3 new_tran1.py 15;
python3 new_tran2.py 15;
python3 new_tran3.py 15;

python3 new_cu.py 16;
python3 new_su.py 16;
python3 new_tran1.py 16;
python3 new_tran2.py 16;
python3 new_tran3.py 16;

python3 new_cu.py 17;
python3 new_su.py 17;
python3 new_tran1.py 17;
python3 new_tran2.py 17;
python3 new_tran3.py 17;

python3 new_cu.py 18;
python3 new_su.py 18;
python3 new_tran1.py 18;
python3 new_tran2.py 18;
python3 new_tran3.py 18;

python3 new_cu.py 19;
python3 new_su.py 19;
python3 new_tran1.py 19;
python3 new_tran2.py 19;
python3 new_tran3.py 19;

python3 new_cu.py 20;
python3 new_su.py 20;
python3 new_tran1.py 20;
python3 new_tran2.py 20;
python3 new_tran3.py 20;

rm *.tbl;
mv test* ~/;