#!/bin/bash
# This script will assist in finding which roullete dealer is scheduled at a given date and time.
# The argument for date should be entered as MMDD without quotations.
# The argument for time should be entered in double quotes.

echo "The dealer on duty is"
cat $1_Dealer_schedule | awk -F" " '{print $1, $2, $5,$6}'| grep "$2"
