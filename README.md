# OBLIVIATOR: Oblivious Parallel Joins and Other Operators
This is the implementation of oblivious parallel join and other operators. We provide here their codes and scripts to deploy and run it.

## Code Structure
    .
    ├── data                      # Data folder
    │   └── big_data_benchmark    # Dataset of the Big Data Benchmark    
    ├── fk_join                   # Oblivious parallel foreign key join
    ├── join                      # Oblivious parallel (non-foreign key) join
    ├── operator_1                # Oblivious parallel scan operator
    ├── operator_2                # Oblivious parallel aggregation operator
    ├── operator_3                # Oblivious parallel foreign key join for BDB
    ├── scripts                   # Scripts for dependencies and datasets
    └── README.md

## Dependencies
This project need gcc-7 and g++-7. This project requires Ubuntu 20.04 LTS to run. The following libraries are required:

- [Open Enclave](https://github.com/openenclave/openenclave)

The `install-dependencies.sh` script in the `scripts` folder will set up the
required repositories and install the dependencies for you through APT. This
script must be run as root If you do not wish to use APT, you may follow the
installation guide for each library individually.

Additionally, you must have `openssl` available in your PATH, which is used to
generate the signed enclave object.

```bash
chmod +x ./scripts/install-dependencies.sh
./scripits/install-dependencies.sh
```

## Datasets

To test with datasets synthesized in the way described in [Krastnikov et al. VLDB'20](https://dl.acm.org/doi/10.14778/3407790.3407814), we run the following commands to generate 1x1, 1xn and a power-law distribution input file with total element number 2<sup>16</sup> to 2<sup>30</sup>.

```bash
python3 /scripts/generate_join_input_1.py
python3 /scripts/generate_join_input_2.py
python3 /scripts/generate_join_input_3.py
```

To test with the dataset from [Big Data Benchmark](https://amplab.cs.berkeley.edu/benchmark/), use the files in data folder directly. TPC-H datasets should be re-formed to the same format to the above datasets, i.e., first 2 numbers indicating the element numbers of each table, and followed by elements from table 1 and 2 respectively.

## Oblivious Parallel Join
To run our oblivious parallel join, please run the following commands. Corresponding output results will be generated and saved as .txt file in the input file directory.

```bash
cd oblivious_parallel_join
make clean
make
./host/parallel ./enclave/parallel_enc.signed number_thread input_file
```

## Oblivious Parallel Foreign Key Join

```bash
cd oblivious_parallel_foreign_key_join
make clean
make
./host/parallel ./enclave/parallel_enc.signed number_thread input_file
```

## BDB Query 1: Scan

```bash
cd operator_1
make clean
make
./host/parallel ./enclave/parallel_enc.signed number_thread input_file
```

## BDB Query 2: Aggregation

```bash
cd operator_2
make clean
make
./host/parallel ./enclave/parallel_enc.signed number_thread input_file
```

## BDB Query 3: Join

```bash
cd operator_3
make clean
make
./host/parallel ./enclave/parallel_enc.signed number_thread input_file
```

## Help

Before running the algorithms, please check sizes of your input files are within the limitation in host/parallel.c (corresponding to the MAX_BUF_SIZE value), and please double-check the SGX enclave configuration (enclave/parallel.conf) is compatible with your machine.

1. MAX_BUF_SIZE limitation in host/parallel.c
2. enclave EPC configuration

Please feel free to
* create a [issue report](https://github.com/x1anwang/Parallel-join/issues).
* Emails are also welcome: [Xian](mailto:xwanggj@connect.ust.hk)
