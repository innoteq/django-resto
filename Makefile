export PYTHONPATH:=.:$(PYTHONPATH)
export DJANGO_SETTINGS_MODULE:=django_resto.test_settings

test:
	django-admin test django_resto

coverage:
	python -m coverage erase
	python -m coverage run --branch --source=django_resto `which django-admin` test django_resto
	python -m coverage html

clean:
	find django_resto -name '*.pyc' -delete
	find django_resto -name __pycache__ -delete
	rm -rf django_resto/tests .coverage *.egg-info build dist docs/_build htmlcov MANIFEST
