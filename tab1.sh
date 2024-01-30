#!/bin/bash -x

cd /Parallel-join/florian_original_for_tpch;
make clean; make sgx L3 = 1;
./app output.txt ~/test1_3.txt | tee -a ~/result_florian_tpch_join3_jan30.txt;
./app output.txt ~/test11_3.txt | tee -a ~/result_florian_tpch_join3_jan30.txt;
./app output.txt ~/test12_3.txt | tee -a ~/result_florian_tpch_join3_jan30.txt;
./app output.txt ~/test13_3.txt | tee -a ~/result_florian_tpch_join3_jan30.txt;
./app output.txt ~/test14_3.txt | tee -a ~/result_florian_tpch_join3_jan30.txt;
./app output.txt ~/test15_3.txt | tee -a ~/result_florian_tpch_join3_jan30.txt;
./app output.txt ~/test16_3.txt | tee -a ~/result_florian_tpch_join3_jan30.txt;