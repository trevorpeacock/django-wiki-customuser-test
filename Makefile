VENVPATH=.env

$(VENVPATH):
	bash -c "virtualenv $(VENVPATH) --no-site-packages --python=python3.5"
	bash -c "source $(VENVPATH)/bin/activate && pip install --upgrade pip"
	bash -c "source $(VENVPATH)/bin/activate && pip install -r requirements.txt"
	bash -c "source $(VENVPATH)/bin/activate && pip install git+git://github.com/django-wiki/django-wiki.git"

.PHONY: migrate
migrate: $(VENVPATH)
	bash -c "source $(VENVPATH)/bin/activate && python ./src/manage.py migrate"

.PHONY: run
run: $(VENVPATH)
	bash -c "source $(VENVPATH)/bin/activate && python ./src/manage.py runserver"

.PHONY: migraterun
migraterun: migrate run
