SHELL := bash

ROOT := $(shell pwd)
PARSER := .parser
PARSER_REPO := https://github.com/yaml/yaml-reference-parser
TESTML := .testml
TESTML_REPO := https://github.com/testml-lang/testml

export PATH := $(TESTML)/bin:$(PATH)
export NODE_PATH := $(PWD)/lib
export TESTML_RUN := coffee-tap

test ?= test/*.tml

.PHONY: test
test: $(TESTML) $(PARSER)
	prove -v $(test)

clean:
	rm -fr $(TESTML) $(PARSER) test/.testml

$(PARSER):
	git clone $(PARSER_REPO) $@

$(TESTML):
	git clone $(TESTML_REPO) $@
	make -C $@ work
