#!/bin/bash

# Function to check if ORACLE_HOME and ORACLE_SID are set
check_oracle_env() {
    if [ -z "$ORACLE_HOME" ] || [ -z "$ORACLE_SID" ]; then
        echo "Oracle environment variables (ORACLE_HOME, ORACLE_SID) are not set."
        exit 1
    fi
}

# Function to open alert log for a specific SID
open_alert_log() {
    # Get Oracle SID dynamically (can be passed as argument or set manually)
    SID=$1

    # Set Oracle environment variables
    export ORACLE_SID=$SID
    export ORACLE_HOME=$(grep -i "^$SID" /etc/oratab | cut -d: -f2)
    export PATH=$ORACLE_HOME/bin:$PATH

    # Check if Oracle environment is correctly set
    check_oracle_env

    # Construct the path to the alert log
    ALERT_LOG_PATH="$ORACLE_HOME/diag/rdbms/$SID/$SID/trace/alert_$SID.log"

    # Check if the alert log file exists
    if [ -f "$ALERT_LOG_PATH" ]; then
        echo "Opening alert log for SID: $SID"
        tail -f "$ALERT_LOG_PATH"
    else
        echo "Alert log file not found for SID: $SID"
        exit 1
    fi
}

# Prompt user to select which SID to examine
echo "Please choose a database to examine (Enter SID):"
read -p "Enter Oracle SID (e.g., ORCL, TESTDB): " DATABASE_SID

# Open the alert log for the selected database
open_alert_log $DATABASE_SID


