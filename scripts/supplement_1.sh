#!/bin/bash -x

cd ~/Parallel-join/different_block_size/oblivious_parallel_join_16/;
make clean; make;
./host/parallel ./enclave/parallel_enc.signed 1 ~/Parallel-join/scripts/join_input_1xn_2power_26.txt;
./host/parallel ./enclave/parallel_enc.signed 8 ~/Parallel-join/scripts/join_input_1xn_2power_26.txt;
./host/parallel ./enclave/parallel_enc.signed 16 ~/Parallel-join/scripts/join_input_1xn_2power_26.txt;
./host/parallel ./enclave/parallel_enc.signed 32 ~/Parallel-join/scripts/join_input_1xn_2power_26.txt;