.PHONY: help setup install clean
.PHONY: article book

help:
	@cat $(firstword $(MAKEFILE_LIST))

setup:
	which npx

install: \
	node_modules

article:
	npx -y zenn new:article

book:
	npx -y zenn new:article

preview:
	npx -y zenn preview

node_modules:
	npm install

clean:
	rm -rf node_modules
