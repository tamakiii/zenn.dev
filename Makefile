.PHONY: help setup initialize prerequisite install update clean

help:
	@cat $(firstword $(MAKEFILE_LIST))

setup: \
	prerequisite

initialize:
	npx --no -- zenn init

prerequisite:
	which npx

install: \
	node_modules

update:
	npm update

preview:
	npx --no -- zenn preview

node_modules:
	npm install

clean:
	rm -rf node_modules
