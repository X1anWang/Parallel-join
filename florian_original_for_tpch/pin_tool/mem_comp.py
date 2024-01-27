#!/usr/bin/python3

import sys
import subprocess
import filecmp


if __name__ == '__main__':
    subprocess.check_output(["make", "-B", "prototype", "L3=1"], cwd="../")

    inp1, inp2 = sys.argv[1], sys.argv[2]
    res1, res2 = 'memproccount1.out', 'memproccount2.out'
    for inp, res in [(inp1, res1), (inp2, res2)]:
        stdout = subprocess.check_output(["pin", "-t", "obj-intel64/memproccount.so",
            '--', "../prototype", inp, "/dev/null"]).decode('utf-8')
        with open(res, "w") as file:
            file.write(stdout)
    subprocess.run(["diff", res1, res2])
    
    subprocess.check_output(["make", "clean"], cwd="../")
        