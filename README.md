# Oblivious Parallel Join and Other Operators
This is the implementation of oblivious parallel join and other operators. We provide here their codes and scripts to deploy and run it.
## Environment Deployment
```bash
chmod +x ./scripts/install-dependencies.sh
./scripits/install-dependencies.sh
```
## Oblivious Parallel Join
```bash
cd oblivious_parallel_join
make clean
make
./host/parallel ./enclave/parallel_enc.signed number_thread input_file
```
## BDB Query 1: Scan
```bash
cd operator_1_test
make clean
make
./host/parallel ./enclave/parallel_enc.signed number_thread input_file
```
## BDB Query 2: Aggregation
```bash
cd operator_2_test
make clean
make
./host/parallel ./enclave/parallel_enc.signed number_thread input_file
```
## BDB Query 3: Join
```bash
cd operator_3_test
make clean
make
./host/parallel ./enclave/parallel_enc.signed number_thread input_file
```