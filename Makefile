export PYTHONPATH:=.:$(PYTHONPATH)
export DJANGO_SETTINGS_MODULE:=django_resto.test_settings

test:
	django-admin.py test django_resto

coverage:
	python -m coverage erase
	python -m coverage run --branch --source=django_resto `which django-admin.py` test django_resto
	python -m coverage html

clean:
	find . -name '*.pyc' -delete
	find . -name __pycache__ -delete
	rm -rf django_resto/tests .coverage dist docs/_build htmlcov MANIFEST
