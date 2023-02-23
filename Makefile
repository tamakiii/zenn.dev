.PHONY: help setup initialize prerequisite install update outdated preview clean

help:
	@cat $(firstword $(MAKEFILE_LIST))

setup: \
	prerequisite ;
	$(MAKE) -f dependency.mk build

initialize:
	npx --no -- zenn init

prerequisite:
	which npx

install: \
	node_modules

update:
	npm update

outdated:
	npm outdated

preview:
	npx --no -- zenn preview

node_modules:
	npm install

uninstall:
	rm -rf node_modules

teardown:
	$(MAKE) -f dependency.mk clean
