.PHONY: help setup clean

help:
	@cat $(firstword $(MAKEFILE_LIST))

setup: \
	test/dependency

test/dependency: | dependency
	ln -s ../$| $@

clean:
	rm -rf test/dependency
