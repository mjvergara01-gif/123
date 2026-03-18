#!/usr/bin/env bash
set -o errexit # exit on error

# Upgrade pip
python -m pip install --upgrade pip

# Install dependencies
pip install -r requirements.txt

# Collect static files and migrate
python manage.py collectstatic --no-input
python manage.py migrate