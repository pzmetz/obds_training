#!/bin/bash

echo "Start - `date`"
START=$(date +%s)
python Test2_determine_C_or_D_guides.py
# do something
# start your script work here
ls -R /etc > /tmp/x
rm -f /tmp/x
# your logic ends here
END=$(date +%s)
DIFF=$(( $END - $START ))
echo "It took $DIFF seconds"
echo "Finish - `date`"
