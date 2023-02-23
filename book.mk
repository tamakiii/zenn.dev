.PHONY: help setup list

PUBLISHED := false
MACHINE_READABLE := false
SUMMARY :=
PRICE := 0
FORMATS := json tsv
FORMAT := $(firstword $(FORMATS))

help:
	@cat $(firstword $(MAKEFILE_LIST))

setup:
	test -d books

list:
	[ $(FORMAT) == "json" ] \
		&& npx --no -- zenn list:books --format=$(FORMAT) | jq 2> /dev/null \
		|| npx --no -- zenn list:books --format=$(FORMAT)

books/%.md: | books
	npx --no -- zenn new:book \
		--slug=$(patsubst $|/%.md,%,$@) \
		--title=$(patsubst $|/%.md,%,$@) \
		--published=$(PUBLISHED) \
		--summary=$(SUMMARY) \
		--price=$(PRICE)
