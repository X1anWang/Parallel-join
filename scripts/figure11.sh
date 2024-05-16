#!/bin/bash -x

cd ~/Parallel-join/;
mkdir result;

cd ~/Parallel-join/fk_join;
make clean; make;

cd ~/Parallel-join/operator_1/;
make clean; make;
./host/parallel ./enclave/parallel_enc.signed 1 ~/Parallel-join/data/bdb_query1_0.txt | tee -a ~/Parallel-join/result/figure11_b.txt;
./host/parallel ./enclave/parallel_enc.signed 32 ~/Parallel-join/data/bdb_query1_0.txt | tee -a ~/Parallel-join/result/figure11_b.txt;

cd ~/Parallel-join/operator_2;
./host/parallel ./enclave/parallel_enc.signed 1 ~/Parallel-join/data/bdb_query2_0.txt | tee -a ~/Parallel-join/result/figure11_b.txt;
./host/parallel ./enclave/parallel_enc.signed 32 ~/Parallel-join/data/bdb_query2_0.txt | tee -a ~/Parallel-join/result/figure11_b.txt;

cd ~/Parallel-join/operator_3;
./host/parallel ./enclave/parallel_enc.signed 1 ~/Parallel-join/data/bdb_query3_0.txt | tee -a ~/Parallel-join/result/figure11_b.txt;
./host/parallel ./enclave/parallel_enc.signed 32 ~/Parallel-join/data/bdb_query3_0.txt | tee -a ~/Parallel-join/result/figure11_b.txt;