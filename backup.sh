#!/bin/sh

BACKUP_DIR="/backups"
NFS_DIR="/nfsshare"
DB_HOST="mysql"
DB_USER="root"
DB_PASS="root_secure_password"
DB_NAME="app_db"

echo "Backup container started!"

while true; do
  TIMESTAMP=$(date +"%Y%m%d_%H%M%S")
  echo "----------------------------------------"
  echo "Starting backup at $TIMESTAMP..."

  mysqldump -h "$DB_HOST" -u "$DB_USER" -p"$DB_PASS" "$DB_NAME" > "$BACKUP_DIR/db_$TIMESTAMP.sql"
  echo "✓ Database backed up."

  tar -czf "$BACKUP_DIR/nfs_$TIMESTAMP.tar.gz" -C "$NFS_DIR" .
  echo "✓ NFS storage archived."

  for file in $(ls -t "$BACKUP_DIR"/db_*.sql 2>/dev/null | sed -e '1,5d'); do 
    rm -f "$file"
    echo "Deleted old DB backup: $file"
  done

  for file in $(ls -t "$BACKUP_DIR"/nfs_*.tar.gz 2>/dev/null | sed -e '1,5d'); do 
    rm -f "$file"
    echo "Deleted old NFS archive: $file"
  done

  echo "Backup $TIMESTAMP completed successfully."
  
  sleep 86400
done
