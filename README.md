# Oblivious Parallel Joins and Other Operators
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
The code (especially its enclave configuration) in this repository is originally tested on Microsoft [Standard_DC32s_v3](https://learn.microsoft.com/en-us/azure/virtual-machines/dv3-dsv3-series) machines. This project need gcc-7 and g++-7. This project requires Ubuntu 20.04 LTS to run. The following libraries are required:

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

To test with the dataset from [Big Data Benchmark](https://amplab.cs.berkeley.edu/benchmark/), please use the files in data folder directly. [TPC-H](https://www.tpc.org/default5.asp) datasets should be re-formed to the same format to the above datasets, i.e., first 2 numbers indicating the element numbers of each table, and followed by elements from table 1 and 2 respectively. You may refer to /scripts/figure10_tpch_1.py, /scripts/figure10_tpch_2.py, /scripts/figure10_tpch_3.py and /scripts/figure11_tpch.py to know more details about how we operate TPC-H datasets.

## Oblivious parallel join (figure 9)

To run our oblivious parallel join, please run the following commands. Corresponding output results will be generated and saved as .txt file in their input file directories, and time consuming information will be printed on the screen and saved in result folder.

```bash
cd ~/Parallel-join/scripts/;
chmod +x ./figure9.sh;
./figure9.sh;
```

## Foreign key join (figure 10)

To run our oblivious and parallel foreign key join, please download [TPC-H](https://www.tpc.org/default5.asp) datasets and process its raw datasets based on codes in the scripts folder. Then run the following command.

```bash
cd ~/Parallel-join/scripts/;
chmod +x ./figure10_prepare.sh;
./figure10_prepare.sh;

./host/parallel ./enclave/parallel_enc.signed [number of threads] [input file path];
```

## Other operators (figure 11)

To reproduce result in Figure 11 (a), please download [TPC-H](https://www.tpc.org/default5.asp) datasets and process its raw datasets based on ./scripts/figure11_tpch.py and following commands below. For big data benchmark operators, run the following command directly.

```bash
cd ~/Parallel-join/fk_join;
make clean; make;
./host/parallel ./enclave/parallel_enc.signed [number of threads] [input file path];

cd ~/Parallel-join/scripts/;
chmod +x ./figure11.sh;
./figure11.sh;
```

## Help

If you encounter any warning/error or want to run the algorithms on other datasets and machines, please check

1. Sizes of your input files are within the limitation in host/parallel.c (corresponding to the MAX_BUF_SIZE value)
2. Please double-check the SGX enclave configuration (enclave/parallel.conf) is enough and compatible with your machine

Please feel free to
* create a [issue report](https://github.com/x1anwang/Parallel-join/issues).
* Emails are welcome: [Xian: xwanggj@connect.ust.hk](mailto:xwanggj@connect.ust.hk)
