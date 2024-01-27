# Parallel-join

Some parts need to update upon recent demands.

Experiment result tab 1 - single thread:

Generate synthesized dataset -->

cd ~/;
python3 gen.py;

Run original Florian's join for its synthesized dataset-->
cd ~/florian_original;
make clean; make sgx L3=1;
./app output.txt input_2power_of_16.txt input_2power_of_18.txt input_2power_of_20.txt input_2power_of_22.txt input_2power_of_24.txt | tee -a ~/result_original_florian_synthesized_dataset.txt;

Run original Florian's join for TPCH-->
cd ~/florian_original_for_tpch;
make clean; make sgx L3=1;
./app output.txt input.txt | tee -a ~/result_original_florian_tpch.txt;

cd ~/florian_original_for_tpch_prolonged;
make clean; make sgx L3=1;
./app output.txt input.txt | tee -a ~/result_original_florian_tpch.txt;
