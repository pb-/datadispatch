all: lint test
.PHONY: all

lint:
	pipenv run flake8 tasks
	pipenv run isort -c
.PHONY: lint

test:
	pipenv run pytest
.PHONY: test

autosort:
	pipenv run isort -y
.PHONY: autosort

dev_install:
	pipenv install --dev
.PHONY: dev_install

dist:
	rm -f dist/*
	pipenv run python setup.py sdist bdist_wheel
.PHONY: dist

upload:
	pipenv run twine upload dist/*
.PHONY: upload
