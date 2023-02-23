.PHONY: help setup

TYPES := tech idea
TYPE := $(firstword $(TYPES))
EMOJI := 🧸
PUBLISHED := false
MACHINE_READABLE := false

help:
	@cat $(firstword $(MAKEFILE_LIST))

setup:
	test -d articles

articles/%.md: | articles
	npx --no -- zenn new:article \
		--slug=$(patsubst $|/%.md,%,$@) \
		--title=$(patsubst $|/%.md,%,$@) \
		--type=$(TYPE) \
		--emoji=$(EMOJI) \
		--published=$(PUBLISHED) \
		--machine-readable=$(MACHINE_READABLE)
