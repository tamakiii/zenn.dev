.PHONY: help setup install build test clean

help:
	@cat $(firstword $(MAKEFILE_LIST))

setup: \
	test/dependency

install: | dependency/zenn-dev/zenn-editor/packages/zenn-cli dependency/zenn-dev/zenn-editor/packages/zenn-markdown-html
	$(foreach directory,$|,cd && pnpm $@)

build: | dependency/zenn-dev/zenn-editor/packages/zenn-markdown-html
	cd $| && pnpm $@

test:
	npx --no -- jest

test/dependency: | dependency
	ln -s ../$| $@

clean:
	rm -rf test/dependency
