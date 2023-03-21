.PHONY: help build clean

NAME := tamakiii-sandbox/zenn.dev/articles/poetry-local-installation
TAG := latest
WORKDIR := /usr/local/lib/tamakiii/zenn.dev/articles/poetry-local-installation

help:
	@cat $(firstword $(MAKEFILE_LIST))

build: Dockerfile
	docker build -t $(NAME):$(TAG) .

bash: build
	docker run -it --rm -v $(CURDIR):$(WORKDIR) $(NAME):$(TAG) $@

clean:
	docker image rm -f $(NAME):$(TAG)
