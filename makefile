export PATH := node_modules/.bin:$(PATH)

all: index.js

%.js: %.esl
	@cat $< \
	| sed '1i \
	  (macro __camelify (require "eslisp-camelify")) \
	  (__camelify \
	  (macro __propertify (require "eslisp-propertify")) \
	  (__propertify' \
	| sed '$$a \
	  ))' \
	| eslc \
	> $@

test: index.js test.js
	node test.js

clean:
	rm -f index.js test.js

.PHONY: all test clean
