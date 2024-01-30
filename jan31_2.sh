#!/bin/bash -x

cd ~/Parallel-join/our_fk_join_new;
make clean; make;
sudo ./host/parallel ./enclave/parallel_enc.signed 1 ~/test1_4.txt ~/test5_4.txt ~/test10_4.txt ~/test50_4.txt | tee -a ~/jan31_result_tab4_fk_tpch.txt;
sudo ./host/parallel ./enclave/parallel_enc.signed 32 ~/test1_4.txt ~/test5_4.txt ~/test10_4.txt ~/test50_4.txt | tee -a ~/jan31_result_tab4_fk_tpch.txt;

cd ~/Parallel-join/our_join_for_syn;
make clean; make;
./host/parallel ./enclave/parallel_enc.signed 1 ~/input_2power_of_22.txt | tee -a ~/jan31_result_tab2.txt;
./host/parallel ./enclave/parallel_enc.signed 2 ~/input_2power_of_22.txt | tee -a ~/jan31_result_tab2.txt;
./host/parallel ./enclave/parallel_enc.signed 4 ~/input_2power_of_22.txt | tee -a ~/jan31_result_tab2.txt;
./host/parallel ./enclave/parallel_enc.signed 8 ~/input_2power_of_22.txt | tee -a ~/jan31_result_tab2.txt;
./host/parallel ./enclave/parallel_enc.signed 16 ~/input_2power_of_22.txt | tee -a ~/jan31_result_tab2.txt;
./host/parallel ./enclave/parallel_enc.signed 32 ~/input_2power_of_22.txt | tee -a ~/jan31_result_tab2.txt;


cd ~/Parallel-join/our_join_for_tpch;
make clean; make;
./host/parallel ./enclave/parallel_enc.signed 1 ~/test1_1.txt ~/test1_2.txt ~/test1_3.txt | tee -a ~/jan31_result_tab2_tpch.txt;
./host/parallel ./enclave/parallel_enc.signed 2 ~/test1_1.txt ~/test1_2.txt ~/test1_3.txt | tee -a ~/jan31_result_tab2_tpch.txt;
./host/parallel ./enclave/parallel_enc.signed 4 ~/test1_1.txt ~/test1_2.txt ~/test1_3.txt | tee -a ~/jan31_result_tab2_tpch.txt;
./host/parallel ./enclave/parallel_enc.signed 8 ~/test1_1.txt ~/test1_2.txt ~/test1_3.txt | tee -a ~/jan31_result_tab2_tpch.txt;
./host/parallel ./enclave/parallel_enc.signed 16 ~/test1_1.txt ~/test1_2.txt ~/test1_3.txt | tee -a ~/jan31_result_tab2_tpch.txt;
./host/parallel ./enclave/parallel_enc.signed 32 ~/test1_1.txt ~/test1_2.txt ~/test1_3.txt | tee -a ~/jan31_result_tab2_tpch.txt;