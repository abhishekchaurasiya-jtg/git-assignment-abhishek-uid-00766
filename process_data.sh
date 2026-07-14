#!/bin/bash

function load_data() {
    echo "Loading data from database..."
    sleep 1
    echo "Data loaded."
}

function process_records() {
    echo "Processing records..."
    for i in {1..5}; do
        echo "Record $i processed."
    done
}

function save_results() {
    echo "Saving results..."
    echo "Done."
}

function main() {
    echo "--- Data Processor v1.0 ---"
    load_data
    process_records
    save_results
    echo "--- Finished ---"
}

main
