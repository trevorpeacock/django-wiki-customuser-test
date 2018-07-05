VENVPATH=.env

VENVPATH_PATCH=.env_patch

cleanall:
	rm -dfr $(VENVPATH) $(VENVPATH_PATCH)

$(VENVPATH):
	bash -c "virtualenv $(VENVPATH) --no-site-packages --python=python3.5"
	bash -c "source $(VENVPATH)/bin/activate && pip install --upgrade pip"
	bash -c "source $(VENVPATH)/bin/activate && pip install -r requirements.txt"
	bash -c "source $(VENVPATH)/bin/activate && pip install git+git://github.com/django-wiki/django-wiki.git"

$(VENVPATH_PATCH):
	bash -c "virtualenv $(VENVPATH_PATCH) --no-site-packages --python=python3.5"
	bash -c "source $(VENVPATH_PATCH)/bin/activate && pip install --upgrade pip"
	bash -c "source $(VENVPATH_PATCH)/bin/activate && pip install -r requirements.txt"
	bash -c "source $(VENVPATH_PATCH)/bin/activate && pip install git+https://github.com/trevorpeacock/django-wiki.git"

.PHONY: migrate
migrate: $(VENVPATH)
	bash -c "source $(VENVPATH)/bin/activate && python ./src-default-model/manage.py migrate"
	bash -c "source $(VENVPATH)/bin/activate && python ./src-custom-model/manage.py migrate"

.PHONY: migrate_patch
migrate_patch: $(VENVPATH_PATCH)
	bash -c "source $(VENVPATH_PATCH)/bin/activate && python ./src-default-model/manage.py migrate"
	bash -c "source $(VENVPATH_PATCH)/bin/activate && python ./src-custom-model/manage.py migrate"

.PHONY: run
run: $(VENVPATH)
	bash -c "source $(VENVPATH)/bin/activate && python ./src-default-model/manage.py check"
	bash -c "source $(VENVPATH)/bin/activate && python ./src-custom-model/manage.py check"
	bash -c "source $(VENVPATH)/bin/activate && python ./src-custom-model/manage.py runserver"

.PHONY: run_patch
run_patch: $(VENVPATH_PATCH)
	bash -c "source $(VENVPATH_PATCH)/bin/activate && python ./src-default-model/manage.py check"
	bash -c "source $(VENVPATH_PATCH)/bin/activate && python ./src-custom-model/manage.py check"
	bash -c "source $(VENVPATH_PATCH)/bin/activate && python ./src-custom-model/manage.py runserver"

.PHONY: migraterun_patch
migraterun_patch: migrate_patch run_patch

.PHONY: migraterun
migraterun: migrate run

