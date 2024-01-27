#!/bin/sh

./merge_join 1input2power16.txt | tee -a ~/expri_oct5_5_1_again.txt;
./merge_join 1input2power18.txt | tee -a ~/expri_oct5_5_1_again.txt;
./merge_join 1input2power20.txt | tee -a ~/expri_oct5_5_1_again.txt;
./merge_join 1input2power22.txt | tee -a ~/expri_oct5_5_1_again.txt;
./merge_join 1input2power24.txt | tee -a ~/expri_oct5_5_1_again.txt;
./merge_join 2input2power4power16.txt | tee -a ~/expri_oct5_5_1_again.txt;
./merge_join 2input2power16power16.txt | tee -a ~/expri_oct5_5_1_again.txt;
./merge_join 2input2power64power16.txt | tee -a ~/expri_oct5_5_1_again.txt;
./merge_join 2input2power256power16.txt | tee -a ~/expri_oct5_5_1_again.txt;