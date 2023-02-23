.PHONY: help setup init prerequisite install clean
.PHONY: article book

SLUG :=

help:
	@cat $(firstword $(MAKEFILE_LIST))

setup: \
	prerequisite \
	init

init:
	npx --no -- zenn init

prerequisite:
	which npx

install: \
	node_modules

preview:
	npx -y zenn preview

node_modules:
	npm install

clean:
	rm -rf node_modules
