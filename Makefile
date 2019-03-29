
modules = $(shell find . -type f -name "*.tf" -exec dirname {} \;|sort -u)
all : fmt validate
.PHONY: all

default: fmt

validate:
	@for m in $(modules); do (terraform validate --check-variables=false "$$m" && echo "√ $$m") || exit 1 ; done

fmt:
	terraform fmt -check
