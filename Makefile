.PHONY: clean train-nlu train-core cmdline server

clean:
	find . -name '*.pyc' -exec rm -f {} +
	find . -name '*.pyo' -exec rm -f {} +
	find . -name '*~' -exec rm -f  {} +
	rm -rf build/
	rm -rf dist/
	rm -rf *.egg-info
	rm -rf docs/_build

train-nlu:
	python -m rasa_nlu.train -c nlu_config.yml --data nlu_data.md -o models --project current --verbose

run-nlu:
	python -m rasa_nlu.server --path ./models

