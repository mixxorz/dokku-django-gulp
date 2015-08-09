#!/usr/bin/env bash

python manage.py collectstatic --noinput

gunicorn --config deploy/gunicorn.conf.py dokku_django_gulp.wsgi
