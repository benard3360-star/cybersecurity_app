#!/usr/bin/env bash
# exit on error
set -o errexit

echo "Starting build process..."

# Upgrade pip
echo "Upgrading pip..."
pip install --upgrade pip

# Install dependencies with no cache to avoid issues
echo "Installing dependencies..."
pip install --no-cache-dir -r requirements-minimal.txt

# Set Django settings module for production
echo "Setting production environment..."
export DJANGO_SETTINGS_MODULE=cybersecurity.settings_production

# Collect static files
echo "Collecting static files..."
python manage.py collectstatic --no-input

# Run migrations
echo "Running database migrations..."
python manage.py migrate

echo "Build completed successfully!"