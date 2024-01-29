#!/bin/bash -x

cd ~/Parallel-join/opaque3;
make clean; make;
./host/parallel ./enclave/parallel_enc.signed 1 ~/Parallel-join/bdb_data/3_2_0.txt ~/Parallel-join/bdb_data/3_2_1.txt ~/Parallel-join/bdb_data/3_2_2.txt | tee -a ~/result_opaque3;

cd ~/Parallel-join/bdb2_check;
make clean; make;
./host/parallel ./enclave/parallel_enc.signed 2 ~/Parallel-join/bdb_data/2_0.txt ~/Parallel-join/bdb_data/2_1.txt ~/Parallel-join/bdb_data/2_2.txt | tee -a ~/result_bdb2_check;
./host/parallel ./enclave/parallel_enc.signed 4 ~/Parallel-join/bdb_data/2_0.txt ~/Parallel-join/bdb_data/2_1.txt ~/Parallel-join/bdb_data/2_2.txt | tee -a ~/result_bdb2_check;
./host/parallel ./enclave/parallel_enc.signed 8 ~/Parallel-join/bdb_data/2_0.txt ~/Parallel-join/bdb_data/2_1.txt ~/Parallel-join/bdb_data/2_2.txt | tee -a ~/result_bdb2_check;
./host/parallel ./enclave/parallel_enc.signed 16 ~/Parallel-join/bdb_data/2_0.txt ~/Parallel-join/bdb_data/2_1.txt ~/Parallel-join/bdb_data/2_2.txt | tee -a ~/result_bdb2_check;
./host/parallel ./enclave/parallel_enc.signed 32 ~/Parallel-join/bdb_data/2_0.txt ~/Parallel-join/bdb_data/2_1.txt ~/Parallel-join/bdb_data/2_2.txt | tee -a ~/result_bdb2_check;

cd ~/Parallel-join/opaque2_check;
make clean; make;
./host/parallel ./enclave/parallel_enc.signed 2 ~/Parallel-join/bdb_data/2_0.txt ~/Parallel-join/bdb_data/2_1.txt ~/Parallel-join/bdb_data/2_2.txt | tee -a ~/result_opaque2_check;
./host/parallel ./enclave/parallel_enc.signed 4 ~/Parallel-join/bdb_data/2_0.txt ~/Parallel-join/bdb_data/2_1.txt ~/Parallel-join/bdb_data/2_2.txt | tee -a ~/result_opaque2_check;
./host/parallel ./enclave/parallel_enc.signed 8 ~/Parallel-join/bdb_data/2_0.txt ~/Parallel-join/bdb_data/2_1.txt ~/Parallel-join/bdb_data/2_2.txt | tee -a ~/result_opaque2_check;
./host/parallel ./enclave/parallel_enc.signed 16 ~/Parallel-join/bdb_data/2_0.txt ~/Parallel-join/bdb_data/2_1.txt ~/Parallel-join/bdb_data/2_2.txt | tee -a ~/result_opaque2_check;
./host/parallel ./enclave/parallel_enc.signed 32 ~/Parallel-join/bdb_data/2_0.txt ~/Parallel-join/bdb_data/2_1.txt ~/Parallel-join/bdb_data/2_2.txt | tee -a ~/result_opaque2_check;



cd ~/Parallel-join/bdb3_2_new_check;
make clean; make;
./host/parallel ./enclave/parallel_enc.signed 2 ~/Parallel-join/bdb_data/3_2_0.txt ~/Parallel-join/bdb_data/3_2_1.txt ~/Parallel-join/bdb_data/3_2_2.txt | tee -a ~/result_bdb3_check;
./host/parallel ./enclave/parallel_enc.signed 4 ~/Parallel-join/bdb_data/3_2_0.txt ~/Parallel-join/bdb_data/3_2_1.txt ~/Parallel-join/bdb_data/3_2_2.txt | tee -a ~/result_bdb3_check;
./host/parallel ./enclave/parallel_enc.signed 8 ~/Parallel-join/bdb_data/3_2_0.txt ~/Parallel-join/bdb_data/3_2_1.txt ~/Parallel-join/bdb_data/3_2_2.txt | tee -a ~/result_bdb3_check;
./host/parallel ./enclave/parallel_enc.signed 16 ~/Parallel-join/bdb_data/3_2_0.txt ~/Parallel-join/bdb_data/3_2_1.txt ~/Parallel-join/bdb_data/3_2_2.txt | tee -a ~/result_bdb3_check;
./host/parallel ./enclave/parallel_enc.signed 32 ~/Parallel-join/bdb_data/3_2_0.txt ~/Parallel-join/bdb_data/3_2_1.txt ~/Parallel-join/bdb_data/3_2_2.txt | tee -a ~/result_bdb3_check;


cd ~/Parallel-join/opaque3_check;
make clean; make;
./host/parallel ./enclave/parallel_enc.signed 2 ~/Parallel-join/bdb_data/3_2_0.txt ~/Parallel-join/bdb_data/3_2_1.txt ~/Parallel-join/bdb_data/3_2_2.txt | tee -a ~/result_opaque3_check;
./host/parallel ./enclave/parallel_enc.signed 4 ~/Parallel-join/bdb_data/3_2_0.txt ~/Parallel-join/bdb_data/3_2_1.txt ~/Parallel-join/bdb_data/3_2_2.txt | tee -a ~/result_opaque3_check;
./host/parallel ./enclave/parallel_enc.signed 8 ~/Parallel-join/bdb_data/3_2_0.txt ~/Parallel-join/bdb_data/3_2_1.txt ~/Parallel-join/bdb_data/3_2_2.txt | tee -a ~/result_opaque3_check;
./host/parallel ./enclave/parallel_enc.signed 16 ~/Parallel-join/bdb_data/3_2_0.txt ~/Parallel-join/bdb_data/3_2_1.txt ~/Parallel-join/bdb_data/3_2_2.txt | tee -a ~/result_opaque3_check;
./host/parallel ./enclave/parallel_enc.signed 32 ~/Parallel-join/bdb_data/3_2_0.txt ~/Parallel-join/bdb_data/3_2_1.txt ~/Parallel-join/bdb_data/3_2_2.txt | tee -a ~/result_opauqe3_check;