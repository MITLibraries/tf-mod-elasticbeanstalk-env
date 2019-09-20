
modules = $(shell find . -type f -name "*.tf" -exec dirname {} \;|sort -u)
all : fmt validate
.PHONY: all

default: fmt

init:
	terraform init

validate:
	@for m in $(modules); do (terraform validate "$$m" && echo "√ $$m") || exit 1 ; done

fmt: init
	terraform fmt -check
