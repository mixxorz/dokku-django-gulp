# dokku-django-gulp

This is the repository used for my blog post [Dockerfile deployment for speedy deploys with Dokku].

# How the project is configured

* [Django] for the web framework
* [Gunicorn] for the server
* [django-environ] to 12-factor the app
* [pip-tools] for more organized package management
* [ManifestStaticFilesStorage] is used as the staticfiles storage
* [Gulp] configured with the [`gulpfile.js` from Mike Street]

[Dockerfile deployment for speedy deploys with Dokku]:http://mitchel.me/2015/using-dockerfiles-for-speedier-deploys-with-dokku/
[Django]:http://djangoproject.com/
[Gunicorn]:http://gunicorn.org/
[django-environ]:https://github.com/joke2k/django-environ
[pip-tools]:https://github.com/nvie/pip-tools
[ManifestStaticFilesStorage]:https://docs.djangoproject.com/en/1.8/ref/contrib/staticfiles/#manifeststaticfilesstorage
[Gulp]:http://gulpjs.com/
[`gulpfile.js` from Mike Street]:http://www.mikestreety.co.uk/blog/a-simple-sass-compilation-gulpfilejs
