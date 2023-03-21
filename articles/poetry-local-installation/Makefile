.PHONY: help version install uninstall

help:
	@cat $(firstword $(MAKEFILE_LIST))

version:
	@python3 --version
	@poetry --version

install: \
	.venv

uninstall:
	rm -rf .venv

.venv:
	poetry install --no-root
