#!/bin/bash

function log_message() {
    echo "[INFO] $1"
}

function calculate_sum() {
    local a=$1
    local b=$2
    # Ensure inputs are numbers
    echo $((a + b))
}

function divide() {
    local a=$1
    local b=$2
    echo $((a / b))
}
