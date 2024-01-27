#!/bin/sh

cd ~/florian/obliv-join-impl-master/;
make clean;
make sgx L3=1; #change makefile
/opt/intel/new-sgxsdk/bin/x64/sgx_sign sign -key ./Enclave/Enclave_private.pem -enclave enclave.so -out enclave.signed.so -config Enclave/Enclave.config.xml;

cd ~/florian/obliv-join-impl-master/;
python3 gen.py;
./app 1input2power16.txt 1input2power18.txt 1input2power20.txt 1input2power22.txt 1input2power24.txt 2input2power4power16.txt 2input2power16power16.txt 2input2power64power16.txt 2input2power256power16.txt | tee -a ~/expri_oct5_2and3_2.txt;




cd ~/florian/obliv-join-impl-master/;
g++ --std=c++11 merge_join.cpp -o merge_join;
./merge_join 1input2power16.txt | tee -a ~/expri_oct5_5_2.txt;
./merge_join 1input2power18.txt | tee -a ~/expri_oct5_5_2.txt;
./merge_join 1input2power20.txt | tee -a ~/expri_oct5_5_2.txt;
./merge_join 1input2power22.txt | tee -a ~/expri_oct5_5_2.txt;
./merge_join 1input2power24.txt | tee -a ~/expri_oct5_5_2.txt;
./merge_join 2input2power4power16.txt | tee -a ~/expri_oct5_5_2.txt;
./merge_join 2input2power16power16.txt | tee -a ~/expri_oct5_5_2.txt;
./merge_join 2input2power64power16.txt | tee -a ~/expri_oct5_5_2.txt;
./merge_join 2input2power256power16.txt | tee -a ~/expri_oct5_5_2.txt;