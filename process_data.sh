#!/bin/bash

function load_data() {
    echo "[LOG] Starting data load..."
    echo "Loading data from database..."
    sleep 1
    echo "[LOG] Data load complete."
}

function process_records() {
    echo "[LOG] Starting record processing..."
    local count=0
    for i in {1..5}; do
        echo "Record $i processed."
        count=$((count + 1))
    done
    echo "[METRIC] Processed $count records total."
}

function save_results() {
    echo "[LOG] Saving..."
    echo "Saving results..."
    echo "[LOG] Save done."
}

function main() {
    echo "--- Data Processor v1.0 (with Logging) ---"
    load_data
    process_records
    save_results
    echo "--- Finished ---"
}

main
