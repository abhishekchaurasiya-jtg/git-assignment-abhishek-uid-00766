#!/bin/bash

function load_data() {
    echo "Loading data from database..."
    if ! sleep 1; then
        echo "Error: Failed to sleep/load"
        exit 1
    fi
    echo "Data loaded successfully."
}

function process_records() {
    echo "Processing records..."
    for i in {1..5}; do
        if [ -z "$i" ]; then
             echo "Error: Invalid record"
             continue
        fi
        echo "Record $i processed."
    done
}

function save_results() {
    echo "Saving results securely..."
    echo "Done."
}

function main() {
    echo "--- Data Processor v1.0 (Secure) ---"
    load_data || exit 1
    process_records
    save_results
    echo "--- Execution Completed ---"
}

main
