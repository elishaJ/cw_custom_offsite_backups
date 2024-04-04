#!/bin/bash
dir="/home/master/gcp_backups"

# Function to upload backup to GCP bucket
upload_to_gcp_bucket() {
    /home/master/google-cloud-sdk/bin/gcloud auth login --cred-file=/home/master/gcp_backups/.conf/tf-sa-identity.json --quiet;
    app="$1"
    backup_file="$2"
    backup_date="$3"
    # Extract the date and time part
    date_time_part=$(echo "$backup_date" | cut -d' ' -f2)
    # Convert the date format
    converted_date=$(date -d "$date_time_part" "+%FT%H:%M:%S")
    fqdn=$(hostname)
    if /home/master/google-cloud-sdk/bin/gsutil cp "$backup_file" gs://cloudways-custom-server-backups/$fqdn/$app/backup-${converted_date}.tgz; then
        echo "$(date "+%b %d %H:%M:%S") Backup file ${backup_file} uploaded successfully." >> $dir/logs/custom_offsite_backups.log
    else 
	echo "Upload failed"
    fi
}

# Function to compare and update latest offsite backup
compare_and_update_latest_backup() {
    app="$1"
    backup_file="$2"
    modification_time=$(stat -c %Y "$backup_file")
    mod_time=$(stat -c %y "$backup_file") # Human readable

    if [ "$modification_time" -gt "$latest_offsite_backup" ]; then
        # New local backup created
        upload_to_gcp_bucket "$app" "$backup_file" "$mod_time"
        latest_offsite_backup="$modification_time"
        echo "$latest_offsite_backup" >> "$latest_offsite_backup_file"
    else
        echo "$(date "+%b %d %H:%M:%S") Latest offsite backup is up to date." >> $dir/logs/custom_offsite_backups.log
    fi
}

for app in $(ls -l /home/master/applications/ | awk '/^d/ {print $NF}'); do
    # File to store the latest offsite backup timestamp
latest_offsite_backup_file="$dir/.backup_info/latest_offsite_${app}_backup.txt"

# Initialize the variable for the latest offsite backup
if [ -f "$latest_offsite_backup_file" ]; then
    latest_offsite_backup=$(cat "$latest_offsite_backup_file")
else
    latest_offsite_backup=0
fi

    backup_file="/home/master/applications/$app/local_backups/backup.tgz" 
    if [ -f "$backup_file" ]; then
        # Check and update latest offsite backup
        compare_and_update_latest_backup "$app" "$backup_file"
    else
        echo "$(date "+%b %d %H:%M:%S") Backup file ${backup_file} not found." >> $dir/logs/custom_offsite_backups.log
    fi
done