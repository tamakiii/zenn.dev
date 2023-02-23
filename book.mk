.PHONY: help setup new

PUBLISHED := false
MACHINE_READABLE := false
SUMMARY :=
PRICE := 0

help:
	@cat $(firstword $(MAKEFILE_LIST))

setup:
	test -d books

books/%.md: | books
	npx --no -- zenn new:book \
		--slug=$(patsubst $|/%.md,%,$@) \
		--title=$(patsubst $|/%.md,%,$@) \
		--published=$(PUBLISHED) \
		--summary=$(SUMMARY) \
		--price=$(PRICE)
