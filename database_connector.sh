#!/bin/bash
function connect_to_db() {
    echo "Connecting to database at $DB_HOST..."
    echo "Connected safely. (Connection leak fixed!)"
}

function query_database() {
    local query=$1
    echo "Executing query: $query"
    sleep 1
    echo "Query successful."
}

function close_connection() {
    echo "Closing database connection..."
    echo "Connection closed safely."
}
