.PHONY: help setup prerequisite install clean
.PHONY: article book

SLUG :=

help:
	@cat $(firstword $(MAKEFILE_LIST))

setup: \
	prerequisite \
	articles \
	books

prerequisite:
	which npx

install: \
	node_modules

articles:
	$(MAKE) -f article.mk setup

books:
	$(MAKE) -f book.mk setup

preview:
	npx -y zenn preview

node_modules:
	npm install

clean:
	rm -rf node_modules
