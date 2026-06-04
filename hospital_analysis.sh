#!/bin/bash

# Member 5: process_vitals()
# Member 6: water_audit() — to be added

# ---- MEMBER 5 FUNCTION ----

process_vitals() {

    echo "============================================"
    echo " Running Critical Vitals Analysis..."
    echo "============================================"

    # Correct file names from hospital_system.py
    HEART_RATE_LOG="active_logs/heart_rate_log.log"
    TEMPERATURE_LOG="active_logs/temperature_log.log"
    OUTPUT_FILE="reports/critical_alerts.txt"

    # Check folders exist
    if [ ! -d "active_logs" ]; then
        echo "ERROR: active_logs folder not found. Run hospital_admin.sh first."
        return 1
    fi

    if [ ! -d "reports" ]; then
        echo "ERROR: reports folder not found. Run hospital_admin.sh first."
        return 1
    fi

    # Check log files exist
    if [ ! -f "$HEART_RATE_LOG" ]; then
        echo "ERROR: heart_rate_log.log not found. Start the engine first."
        return 1
    fi

    if [ ! -f "$TEMPERATURE_LOG" ]; then
        echo "ERROR: temperature_log.log not found. Start the engine first."
        return 1
    fi

    # Create the report file with a header
    echo "CRITICAL ALERTS REPORT" > "$OUTPUT_FILE"
    echo "Generated on: $(date)" >> "$OUTPUT_FILE"
    echo "--------------------------------------------" >> "$OUTPUT_FILE"
    echo "Timestamp | Device_ID | Value" >> "$OUTPUT_FILE"

    # Search heart rate log for CRITICAL rows
    # The separator is | so we use -F'|'
    # $1=Timestamp $2=Device_ID $3=Value $4=Status
    echo "" >> "$OUTPUT_FILE"
    echo "--- HEART RATE CRITICAL READINGS ---" >> "$OUTPUT_FILE"
    grep "CRITICAL" "$HEART_RATE_LOG" | awk -F'|' '{print $1 "|" $2 "|" $3}' >> "$OUTPUT_FILE"

    # Search temperature log for CRITICAL rows
    echo "" >> "$OUTPUT_FILE"
    echo "--- TEMPERATURE CRITICAL READINGS ---" >> "$OUTPUT_FILE"
    grep "CRITICAL" "$TEMPERATURE_LOG" | awk -F'|' '{print $1 "|" $2 "|" $3}' >> "$OUTPUT_FILE"

    echo "" >> "$OUTPUT_FILE"
    echo "--------------------------------------------" >> "$OUTPUT_FILE"
    echo "End of Report" >> "$OUTPUT_FILE"

    # Count total critical readings found
    CRITICAL_COUNT=$(grep "CRITICAL" "$HEART_RATE_LOG" "$TEMPERATURE_LOG" | wc -l)

    echo ""
    echo "✔ Critical alerts saved to: $OUTPUT_FILE"
    echo "Total CRITICAL readings found: $CRITICAL_COUNT"
    echo ""
}


# ---- MEMBER 6 FUNCTION Down here ----

# u will write your code here before the function call


#this is where u will call your function
process_vitals
