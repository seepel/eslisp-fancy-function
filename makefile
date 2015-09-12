export PATH := node_modules/.bin:$(PATH)

all: index.js

%.js: %.esl
	eslc < $< > $@

test: index.js test.js
	node test.js

clean:
	rm -f index.js test.js

.PHONY: all test clean
