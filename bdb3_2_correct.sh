#!/bin/bash -x

cd ~/Parallel-join/bdb3_2_new;
make clean; make;
./host/parallel ./enclave/parallel_enc.signed 1 ../bdb_data/3_2_0.txt ../bdb_data/3_2_1.txt ../bdb_data/3_2_2.txt | tee -a ~/result_bdb3_2_fk_new_correct.txt;
./host/parallel ./enclave/parallel_enc.signed 2 ../bdb_data/3_2_0.txt ../bdb_data/3_2_1.txt ../bdb_data/3_2_2.txt | tee -a ~/result_bdb3_2_fk_new_correct.txt;
./host/parallel ./enclave/parallel_enc.signed 4 ../bdb_data/3_2_0.txt ../bdb_data/3_2_1.txt ../bdb_data/3_2_2.txt | tee -a ~/result_bdb3_2_fk_new_correct.txt;
./host/parallel ./enclave/parallel_enc.signed 8 ../bdb_data/3_2_0.txt ../bdb_data/3_2_1.txt ../bdb_data/3_2_2.txt | tee -a ~/result_bdb3_2_fk_new_correct.txt;
./host/parallel ./enclave/parallel_enc.signed 16 ../bdb_data/3_2_0.txt ../bdb_data/3_2_1.txt ../bdb_data/3_2_2.txt | tee -a ~/result_bdb3_2_fk_new_correct.txt;
./host/parallel ./enclave/parallel_enc.signed 32 ../bdb_data/3_2_0.txt ../bdb_data/3_2_1.txt ../bdb_data/3_2_2.txt | tee -a ~/result_bdb3_2_fk_new_correct.txt;