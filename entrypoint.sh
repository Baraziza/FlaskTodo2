#!/bin/bash
# Wait for MySQL to be available
until mysql -h "$DB_HOST" -u "$DB_USER" -p"$DB_PASSWORD" -e "SHOW DATABASES"; do
  echo "Waiting for MySQL..."
  sleep 3
done

# Start Flask application
flask run --host=0.0.0.0
