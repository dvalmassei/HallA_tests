#!/bin/bash

# Number of hourly cycles
NUM_CYCLES=8

# Run number (incremented for every CMData invocation)
runNum=1

for ((hour=1; hour<=NUM_CYCLES; hour++)); do
    echo "Starting hourly cycle $hour of $NUM_CYCLES"

    # Channels 1 and 2
    echo "Running channels 1 and 2 (run $runNum)"
    echo " ./CMData -l 1 -s 1 -c1 1 -c2 2 -r $runNum"
    ((runNum++))

    sleep 3  # Wait 5 minutes

    # Channels 3 and 4
    echo "Running channels 3 and 4 (run $runNum)"
    echo "./CMData -l 1 -s 1 -c1 3 -c2 4 -r $runNum"
    ((runNum++))

    sleep 3  # Wait 5 minutes

    # Channels 5 and 6
    echo "Running channels 5 and 6 (run $runNum)"
    echo "./CMData -l 1 -s 1 -c1 5 -c2 6 -r $runNum"
    ((runNum++))

    # Wait until the next hourly cycle, except after the final cycle.
    if (( hour < NUM_CYCLES )); then
        echo "Waiting 50 minutes until the next hourly cycle..."
        sleep 3
    fi
done

echo "All 8 hourly cycles completed."