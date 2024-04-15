This project need gcc-7 and g++-7.
Install dependencies using ./scripts/install-dependencies.sh
Then source openenclave

To Compile:
make clean
make


To Run:
sudo mpirun [-hosts host_list] ./host/parallel ./enclave/parallel_enc.signed array_size num_threads
