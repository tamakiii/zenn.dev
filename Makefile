.PHONY: help setup install clean
.PHONY: article book

SLUG :=

help:
	@cat $(firstword $(MAKEFILE_LIST))

setup:
	which npx

install: \
	node_modules

article:
	npx -y zenn new:article --slug $(SLUG)

book:
	npx -y zenn new:article --slug $(SLUG)

preview:
	npx -y zenn preview

node_modules:
	npm install

clean:
	rm -rf node_modules
