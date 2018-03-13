#!/bin/bash

if [ "$1" == "" ]; then
    echo "usage: $0 tcl_file.tcl"
    exit 1
fi

# get all of the testbed command declarations and append them to the file to syntax check
cat compact.tcl.in | grep "tb" | grep "proc" | sed 's/$/}/' >> $1
# add the new command as well
echo "proc new {value} {}" >> $1

# actually run the command
./nagelfar.tcl -quiet -exitcode $1
