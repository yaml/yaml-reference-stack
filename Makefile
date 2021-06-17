export NODE_PATH := $(PWD)/lib

.PHONY: test
test:
	coffee test/test.coffee
