#!/usr/bin/python3

import sys

SYSCALL_DATAFILE="./syscalls_data"

if __name__ == "__main__":

    syscalls = []

    with open(SYSCALL_DATAFILE) as f:

        line = f.readline().replace("\n", "")

        while line:
            if line == "" or line.startswith("#"):
                continue

            splitline = line.split(",")
            syscall = {"name" : splitline[2], "id" : int(splitline[0]),
                    "args" : int(splitline[1])}

            # Sanity checks remove later
            if syscall["id"] > 350:
                print("ERROR: invalid syscall id: " + str(syscall["id"]))
                sys.exit()

            if syscall["args"] > 6:
                printf("ERROR: invalid parameter num. :" + str(syscall["args"]))
                sys.exit()

            line = f.readline().replace("\n", "")

