.PHONY: help setup install build test clean teardown

help:
	@cat $(firstword $(MAKEFILE_LIST))

setup: \
	test/dependency

install:
	cd dependency/zenn-dev/zenn-editor/packages/zenn-cli && pnpm install
	cd dependency/zenn-dev/zenn-editor/packages/zenn-markdown-html && pnpm install
	cd --declaration --allowJs --emitDeclarationOnly && pnpm build

build:
	npx --no -- tsc \
		--declaration \
		--emitDeclarationOnly \
		--outDir test/types/zenn-model \
		dependency/zenn-dev/zenn-editor/packages/zenn-model/src/*.ts

test:
	npx --no -- jest

test/dependency: | dependency
	ln -s ../$| $@

clean:
	rm -rf dependency/zenn-dev/zenn-model

teardown:
	rm -rf test/dependency
