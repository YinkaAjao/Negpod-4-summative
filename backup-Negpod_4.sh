#!/bin/bash

# Set the variables
REMOTE_HOST="7d7ba2c0ed04.70681577.alu-cod.online"
REMOTE_USER="7d7ba2c0ed04"
REMOTE_PASS="db8ccf55ac830058265d"
REMOTE_DIR="/summative/0524-2024m"
LOCAL_DIR="./negpod_4-q1/"

# Create the backup archive
tar -czf backup.tar.gz $LOCAL_DIR

# Transfer the backup to the remote server
sshpass -p "$REMOTE_PASS" scp backup.tar.gz "$REMOTE_USER@$REMOTE_HOST:$REMOTE_DIR"

# Clean up the local backup
rm backup.tar.gz

echo "Backup completed successfully!"
