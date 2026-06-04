#!/bin/bash
# Script: hospital_archive.sh
# Purpose: Archive active logs and reset log files for continued data collection
# Author: Quentin
TIMESTAMP=$(date +%Y%m%d_%H%M)
for file in active_logs/*.log
	do
		filename=$(basename $file .log)
		mv $file archived_logs/${filename}_${TIMESTAMP}.log
		touch active_logs/${filename}.log
		done
		echo "Logs archived successfully on $TIMESTAMP"

