#!/bin/bash
source database_connector.sh

function get_user() {
    connect_to_db
    echo "Fetching user $1..."
}
