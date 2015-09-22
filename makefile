export PATH := node_modules/.bin:$(PATH)

all: index.js

%.js: %.esl
	@eslc -t eslisp-propertify -t eslisp-camelify < $< > $@

test: index.js test.js
	node test.js

test-readme: index.js test.js readme.md
	txm readme.md

clean:
	rm -f index.js test.js

.PHONY: all test clean
