This project need gcc-7 and g++-7.
Install dependencies using ./scripts/install-dependencies.sh
Then source openenclave

To Compile:
make clean
make


To Run:
sudo mpirun [-hosts host_list] ./host/parallel ./enclave/parallel_enc.signed array_size num_threads

remove -DOE_SIMULATION_CERT in the makefile if there are errors during execution.
Only change the element values in common/elem_t.h
