#!/bin/bash -x

cd ~/Parallel-join/scripts/;
python3 generate_join_input_2.py;
sed '53i CFLAGS = -march=native -mno-avx512f -O3 -Wall -Wextra -Werror -D PRE_ALLOCATION' Makefile | tee ~/Parallel-join/join/Makefile;

cd ~/Parallel-join/;
mkdir result;

cd ~/Parallel-join/join/;
make clean; make;
./host/parallel ./enclave/parallel_enc.signed 1 ~/Parallel-join/data/synthesized/join_input_1xn_2power_16.txt | tee -a ~/Parallel-join/result/result_figure9.txt;
./host/parallel ./enclave/parallel_enc.signed 2 ~/Parallel-join/data/synthesized/join_input_1xn_2power_16.txt | tee -a ~/Parallel-join/result/result_figure9.txt;
./host/parallel ./enclave/parallel_enc.signed 4 ~/Parallel-join/data/synthesized/join_input_1xn_2power_16.txt | tee -a ~/Parallel-join/result/result_figure9.txt;
./host/parallel ./enclave/parallel_enc.signed 8 ~/Parallel-join/data/synthesized/join_input_1xn_2power_16.txt | tee -a ~/Parallel-join/result/result_figure9.txt;
./host/parallel ./enclave/parallel_enc.signed 16 ~/Parallel-join/data/synthesized/join_input_1xn_2power_16.txt | tee -a ~/Parallel-join/result/result_figure9.txt;
./host/parallel ./enclave/parallel_enc.signed 32 ~/Parallel-join/data/synthesized/join_input_1xn_2power_16.txt | tee -a ~/Parallel-join/result/result_figure9.txt;

./host/parallel ./enclave/parallel_enc.signed 1 ~/Parallel-join/data/synthesized/join_input_1xn_2power_18.txt | tee -a ~/Parallel-join/result/result_figure9.txt;
./host/parallel ./enclave/parallel_enc.signed 2 ~/Parallel-join/data/synthesized/join_input_1xn_2power_18.txt | tee -a ~/Parallel-join/result/result_figure9.txt;
./host/parallel ./enclave/parallel_enc.signed 4 ~/Parallel-join/data/synthesized/join_input_1xn_2power_18.txt | tee -a ~/Parallel-join/result/result_figure9.txt;
./host/parallel ./enclave/parallel_enc.signed 8 ~/Parallel-join/data/synthesized/join_input_1xn_2power_18.txt | tee -a ~/Parallel-join/result/result_figure9.txt;
./host/parallel ./enclave/parallel_enc.signed 16 ~/Parallel-join/data/synthesized/join_input_1xn_2power_18.txt | tee -a ~/Parallel-join/result/result_figure9.txt;
./host/parallel ./enclave/parallel_enc.signed 32 ~/Parallel-join/data/synthesized/join_input_1xn_2power_18.txt | tee -a ~/Parallel-join/result/result_figure9.txt;

./host/parallel ./enclave/parallel_enc.signed 1 ~/Parallel-join/data/synthesized/join_input_1xn_2power_20.txt | tee -a ~/Parallel-join/result/result_figure9.txt;
./host/parallel ./enclave/parallel_enc.signed 2 ~/Parallel-join/data/synthesized/join_input_1xn_2power_20.txt | tee -a ~/Parallel-join/result/result_figure9.txt;
./host/parallel ./enclave/parallel_enc.signed 4 ~/Parallel-join/data/synthesized/join_input_1xn_2power_20.txt | tee -a ~/Parallel-join/result/result_figure9.txt;
./host/parallel ./enclave/parallel_enc.signed 8 ~/Parallel-join/data/synthesized/join_input_1xn_2power_20.txt | tee -a ~/Parallel-join/result/result_figure9.txt;
./host/parallel ./enclave/parallel_enc.signed 16 ~/Parallel-join/data/synthesized/join_input_1xn_2power_20.txt | tee -a ~/Parallel-join/result/result_figure9.txt;
./host/parallel ./enclave/parallel_enc.signed 32 ~/Parallel-join/data/synthesized/join_input_1xn_2power_20.txt | tee -a ~/Parallel-join/result/result_figure9.txt;

./host/parallel ./enclave/parallel_enc.signed 1 ~/Parallel-join/data/synthesized/join_input_1xn_2power_22.txt | tee -a ~/Parallel-join/result/result_figure9.txt;
./host/parallel ./enclave/parallel_enc.signed 2 ~/Parallel-join/data/synthesized/join_input_1xn_2power_22.txt | tee -a ~/Parallel-join/result/result_figure9.txt;
./host/parallel ./enclave/parallel_enc.signed 4 ~/Parallel-join/data/synthesized/join_input_1xn_2power_22.txt | tee -a ~/Parallel-join/result/result_figure9.txt;
./host/parallel ./enclave/parallel_enc.signed 8 ~/Parallel-join/data/synthesized/join_input_1xn_2power_22.txt | tee -a ~/Parallel-join/result/result_figure9.txt;
./host/parallel ./enclave/parallel_enc.signed 16 ~/Parallel-join/data/synthesized/join_input_1xn_2power_22.txt | tee -a ~/Parallel-join/result/result_figure9.txt;
./host/parallel ./enclave/parallel_enc.signed 32 ~/Parallel-join/data/synthesized/join_input_1xn_2power_22.txt | tee -a ~/Parallel-join/result/result_figure9.txt;

./host/parallel ./enclave/parallel_enc.signed 1 ~/Parallel-join/data/synthesized/join_input_1xn_2power_24.txt | tee -a ~/Parallel-join/result/result_figure9.txt;
./host/parallel ./enclave/parallel_enc.signed 2 ~/Parallel-join/data/synthesized/join_input_1xn_2power_24.txt | tee -a ~/Parallel-join/result/result_figure9.txt;
./host/parallel ./enclave/parallel_enc.signed 4 ~/Parallel-join/data/synthesized/join_input_1xn_2power_24.txt | tee -a ~/Parallel-join/result/result_figure9.txt;
./host/parallel ./enclave/parallel_enc.signed 8 ~/Parallel-join/data/synthesized/join_input_1xn_2power_24.txt | tee -a ~/Parallel-join/result/result_figure9.txt;
./host/parallel ./enclave/parallel_enc.signed 16 ~/Parallel-join/data/synthesized/join_input_1xn_2power_24.txt | tee -a ~/Parallel-join/result/result_figure9.txt;
./host/parallel ./enclave/parallel_enc.signed 32 ~/Parallel-join/data/synthesized/join_input_1xn_2power_24.txt | tee -a ~/Parallel-join/result/result_figure9.txt;

./host/parallel ./enclave/parallel_enc.signed 1 ~/Parallel-join/data/synthesized/join_input_1xn_2power_26.txt | tee -a ~/Parallel-join/result/result_figure9.txt;
./host/parallel ./enclave/parallel_enc.signed 2 ~/Parallel-join/data/synthesized/join_input_1xn_2power_26.txt | tee -a ~/Parallel-join/result/result_figure9.txt;
./host/parallel ./enclave/parallel_enc.signed 4 ~/Parallel-join/data/synthesized/join_input_1xn_2power_26.txt | tee -a ~/Parallel-join/result/result_figure9.txt;
./host/parallel ./enclave/parallel_enc.signed 8 ~/Parallel-join/data/synthesized/join_input_1xn_2power_26.txt | tee -a ~/Parallel-join/result/result_figure9.txt;
./host/parallel ./enclave/parallel_enc.signed 16 ~/Parallel-join/data/synthesized/join_input_1xn_2power_26.txt | tee -a ~/Parallel-join/result/result_figure9.txt;
./host/parallel ./enclave/parallel_enc.signed 32 ~/Parallel-join/data/synthesized/join_input_1xn_2power_26.txt | tee -a ~/Parallel-join/result/result_figure9.txt;

./host/parallel ./enclave/parallel_enc.signed 1 ~/Parallel-join/data/synthesized/join_input_1xn_2power_28.txt | tee -a ~/Parallel-join/result/result_figure9.txt;
./host/parallel ./enclave/parallel_enc.signed 2 ~/Parallel-join/data/synthesized/join_input_1xn_2power_28.txt | tee -a ~/Parallel-join/result/result_figure9.txt;
./host/parallel ./enclave/parallel_enc.signed 4 ~/Parallel-join/data/synthesized/join_input_1xn_2power_28.txt | tee -a ~/Parallel-join/result/result_figure9.txt;
./host/parallel ./enclave/parallel_enc.signed 8 ~/Parallel-join/data/synthesized/join_input_1xn_2power_28.txt | tee -a ~/Parallel-join/result/result_figure9.txt;
./host/parallel ./enclave/parallel_enc.signed 16 ~/Parallel-join/data/synthesized/join_input_1xn_2power_28.txt | tee -a ~/Parallel-join/result/result_figure9.txt;
./host/parallel ./enclave/parallel_enc.signed 32 ~/Parallel-join/data/synthesized/join_input_1xn_2power_28.txt | tee -a ~/Parallel-join/result/result_figure9.txt;

./host/parallel ./enclave/parallel_enc.signed 1 ~/Parallel-join/data/synthesized/join_input_1xn_2power_30.txt | tee -a ~/Parallel-join/result/result_figure9.txt;
./host/parallel ./enclave/parallel_enc.signed 2 ~/Parallel-join/data/synthesized/join_input_1xn_2power_30.txt | tee -a ~/Parallel-join/result/result_figure9.txt;
./host/parallel ./enclave/parallel_enc.signed 4 ~/Parallel-join/data/synthesized/join_input_1xn_2power_30.txt | tee -a ~/Parallel-join/result/result_figure9.txt;
./host/parallel ./enclave/parallel_enc.signed 8 ~/Parallel-join/data/synthesized/join_input_1xn_2power_30.txt | tee -a ~/Parallel-join/result/result_figure9.txt;
./host/parallel ./enclave/parallel_enc.signed 16 ~/Parallel-join/data/synthesized/join_input_1xn_2power_30.txt | tee -a ~/Parallel-join/result/result_figure9.txt;
./host/parallel ./enclave/parallel_enc.signed 32 ~/Parallel-join/data/synthesized/join_input_1xn_2power_30.txt | tee -a ~/Parallel-join/result/result_figure9.txt;