# django-wiki-customuser-test

Demonstrates the [problem](https://github.com/django-wiki/django-wiki/pull/865) with django-wiki when using a custom user model with no `username` field

```
> ~/git/django-wiki-customuser-test$ make run
bash -c "source .env/bin/activate && python ./src/manage.py runserver"
Performing system checks...

Unhandled exception in thread started by <function check_errors.<locals>.wrapper at 0x7f248e768400>
Traceback (most recent call last):
  File "~/git/django-wiki-customuser-test/.env/lib/python3.5/site-packages/django/utils/autoreload.py", line 228, in wrapper
    fn(*args, **kwargs)
  File "~/git/django-wiki-customuser-test/.env/lib/python3.5/site-packages/django/core/management/commands/runserver.py", line 124, in inner_run
    self.check(display_num_errors=True)
  File "~/git/django-wiki-customuser-test/.env/lib/python3.5/site-packages/django/core/management/base.py", line 359, in check
    include_deployment_checks=include_deployment_checks,
  File "~/git/django-wiki-customuser-test/.env/lib/python3.5/site-packages/django/core/management/base.py", line 346, in _run_checks
    return checks.run_checks(**kwargs)
  File "~/git/django-wiki-customuser-test/.env/lib/python3.5/site-packages/django/core/checks/registry.py", line 81, in run_checks
    new_errors = check(app_configs=app_configs)
  File "~/git/django-wiki-customuser-test/.env/lib/python3.5/site-packages/django/core/checks/urls.py", line 16, in check_url_config
    return check_resolver(resolver)
  File "~/git/django-wiki-customuser-test/.env/lib/python3.5/site-packages/django/core/checks/urls.py", line 26, in check_resolver
    return check_method()
  File "~/git/django-wiki-customuser-test/.env/lib/python3.5/site-packages/django/urls/resolvers.py", line 254, in check
    for pattern in self.url_patterns:
  File "~/git/django-wiki-customuser-test/.env/lib/python3.5/site-packages/django/utils/functional.py", line 35, in __get__
    res = instance.__dict__[self.name] = self.func(instance)
  File "~/git/django-wiki-customuser-test/.env/lib/python3.5/site-packages/django/urls/resolvers.py", line 405, in url_patterns
    patterns = getattr(self.urlconf_module, "urlpatterns", self.urlconf_module)
  File "~/git/django-wiki-customuser-test/.env/lib/python3.5/site-packages/django/utils/functional.py", line 35, in __get__
    res = instance.__dict__[self.name] = self.func(instance)
  File "~/git/django-wiki-customuser-test/.env/lib/python3.5/site-packages/django/urls/resolvers.py", line 398, in urlconf_module
    return import_module(self.urlconf_name)
  File "~/git/django-wiki-customuser-test/.env/lib/python3.5/importlib/__init__.py", line 126, in import_module
    return _bootstrap._gcd_import(name[level:], package, level)
  File "<frozen importlib._bootstrap>", line 986, in _gcd_import
  File "<frozen importlib._bootstrap>", line 969, in _find_and_load
  File "<frozen importlib._bootstrap>", line 958, in _find_and_load_unlocked
  File "<frozen importlib._bootstrap>", line 673, in _load_unlocked
  File "<frozen importlib._bootstrap_external>", line 665, in exec_module
  File "<frozen importlib._bootstrap>", line 222, in _call_with_frames_removed
  File "~/git/django-wiki-customuser-test/src/testproject/urls.py", line 26, in <module>
    url(r'', include('wiki.urls'))
  File "~/git/django-wiki-customuser-test/.env/lib/python3.5/site-packages/django/conf/urls/__init__.py", line 50, in include
    urlconf_module = import_module(urlconf_module)
  File "~/git/django-wiki-customuser-test/.env/lib/python3.5/importlib/__init__.py", line 126, in import_module
    return _bootstrap._gcd_import(name[level:], package, level)
  File "<frozen importlib._bootstrap>", line 986, in _gcd_import
  File "<frozen importlib._bootstrap>", line 969, in _find_and_load
  File "<frozen importlib._bootstrap>", line 958, in _find_and_load_unlocked
  File "<frozen importlib._bootstrap>", line 673, in _load_unlocked
  File "<frozen importlib._bootstrap_external>", line 665, in exec_module
  File "<frozen importlib._bootstrap>", line 222, in _call_with_frames_removed
  File "~/git/django-wiki-customuser-test/.env/lib/python3.5/site-packages/wiki/urls.py", line 6, in <module>
    from wiki.views import accounts, article, deleted_list
  File "~/git/django-wiki-customuser-test/.env/lib/python3.5/site-packages/wiki/views/accounts.py", line 21, in <module>
    from wiki import forms
  File "~/git/django-wiki-customuser-test/.env/lib/python3.5/site-packages/wiki/forms.py", line 570, in <module>
    class UserCreationForm(UserCreationForm):
  File "~/git/django-wiki-customuser-test/.env/lib/python3.5/site-packages/django/forms/models.py", line 277, in __new__
    raise FieldError(message)
django.core.exceptions.FieldError: Unknown field(s) (username) specified for MyUser
```
