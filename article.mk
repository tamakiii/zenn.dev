.PHONY: help setup list

TYPES := tech idea
TYPE := $(firstword $(TYPES))
EMOJI := 🧸
PUBLISHED := false
MACHINE_READABLE := false
FORMATS := json tsv
FORMAT := $(firstword $(FORMATS))

help:
	@cat $(firstword $(MAKEFILE_LIST))

setup:
	test -d articles

list:
	[ $(FORMAT) == "json" ] \
		&& npx --no -- zenn list:articles --format=$(FORMAT) | jq 2> /dev/null \
		|| npx --no -- zenn list:articles --format=$(FORMAT)

articles/%.md: | articles
	npx --no -- zenn new:article \
		--slug=$(patsubst $|/%.md,%,$@) \
		--title=$(patsubst $|/%.md,%,$@) \
		--type=$(TYPE) \
		--emoji=$(EMOJI) \
		--published=$(PUBLISHED) \
		--machine-readable=$(MACHINE_READABLE)
