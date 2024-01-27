# Oblivious Databases Joins

This is an SGX-enabled C++ implementation of the  data-oblivious equi-join algorithm described in the paper "Efficient Oblivious Database Joins."

## Compile

To compile the prototype without SGX support, run `make prototype`. To compile the SGX version, run `make sgx`.  The following compiler flags can be toggled in the makefile:

| Flag | Value | Description |
| ------------- | ------------- | ------------- |
|  `L3` | `0` | Compile standard implementation, as in the [Include](Include) directory |
|  `L3` | `1` | Compile the transformed implementation, as in the [IncludeL3](IncludeL3) directory |
|  `LOG_MODE` | `NONE` | Do not log memory accesses |
|  `LOG_MODE`  | `HASH` | Prototype only: Keep a (SHA-256) hash of the memory access log. (This requires the hash to be updated during every memory access.)|
|  `LOG_MODE` | `ALL` | Prototype only: Store the whole memory access log for direct examination. Warning: can get very large, even for small inputs. |
| `SUBTIME` | `0` | Disables timing of subprocedures |
| `SUBTIME` | `1` | Enables timing of subprocedures |

## Usage

The program can be run by issuing

```
./{prototype|app} INPUT_FILE OUTPUT_FILE
```

The input consists of a plaintext file, whose first line is two integers **N1** and **N2** denoting the table sizes. These are then followed by **N1** pairs of integers for the first table and **N2** for the second table, where each pair is a join attribute followed by a data attribute. See the [inputs](inputs) directory for test inputs and their corresponding outputs.


## Dependencies

None required for the prototype except the standard C++ library, make, and a suitable compiler (tested on: gcc version 7.4.0, Ubuntu 18.04.1).

The SGX version supports only Linux and requires the [Intel(R) SGX SDK and Intel(R) SGX PSW Package](https://github.com/intel/linux-sgx).

Using `LOG_MOE=HASH` requires the OpenSSL library (libssl-dev) to be installed.