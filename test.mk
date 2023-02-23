.PHONY: help setup install test teardown

help:
	@cat $(firstword $(MAKEFILE_LIST))

setup: \
	test/dependency

install:
	cd dependency/zenn-dev/zenn-editor/packages/zenn-cli && pnpm install
	cd dependency/zenn-dev/zenn-editor/packages/zenn-markdown-html && pnpm install
	cd --declaration --allowJs --emitDeclarationOnly && pnpm build

test:
	npx --no -- jest

test/dependency: | dependency
	ln -s ../$| $@

teardown:
	rm -rf test/dependency
