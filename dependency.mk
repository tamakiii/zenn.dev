.PHONY: help setup rev-parse clean

VERSION_ZENN_EDITOR :=  0.1.140

help:
	@cat $(firstword $(MAKEFILE_LIST))

setup: \
	dependency/zenn-dev/zenn-editor

rev-parse: | dependency/zenn-dev/zenn-editor
	$(foreach directory,$|,git -C $(directory) rev-parse @)
	$(foreach directory,$|,git -C $(directory) rev-parse --abbrev-ref @)

dependency/zenn-dev/zenn-editor: dependency/zenn-dev
	git clone https://github.com/zenn-dev/zenn-editor.git $@
	git -C $@ switch -c tags/0.1.140

dependency/zenn-dev: dependency
	mkdir $@

dependency:
	mkdir $@

clean:
	rm -rf dependency
