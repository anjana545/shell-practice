#!/bin/bash

#DATE=$(date)

START_TIME=$(date +%s)

sleep 10 &

END_TIME=$(date +%s)

TOTAL_TIME=$(START_TIME)-$(END_TIME)


echo "Timestamp executed: $(TOTAL_TIME) seconds"