#!/usr/bin/env bash
set -o errexit

pip install -r requirements.txt
python manage.py collectstatic --no-input
python manage.py migrate

# force recreate (delete then create)
python manage.py shell -c "from django.contrib.auth.models import User; User.objects.filter(username='admin').delete()"

python manage.py createsu