#!/bin/bash

grep -i '5\|8\|2\|11' *schedule | awk '{print substr($1,22,2)" "$2" "$5" "$6}' > Dealers_working_during_losses
