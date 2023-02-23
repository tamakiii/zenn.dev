.PHONY: help setup new

PREFIX ?= $(shell whoami)
DATE ?= $(shell date +%Y%m%d)
SLUG ?= $(PREFIX)_$(DATE)
TITLE ?=  $(DATE)
TYPE := .tech
EMOJI := 🧸
PUBLISHED := false
MACHINE_READABLE := false

help:
	@cat $(firstword $(MAKEFILE_LIST))

setup: \
	books

new:
	npx -y zenn new:article \
		--slug $(SLUG) \
		--title $(TITLE) \
		--type $(TYPE) \
		--emoji $(EMOJI) \
		--published $(PUBLISHED) \
		--machine-readable $(MACHINE_READABLE)

books:
	mkdir $@
