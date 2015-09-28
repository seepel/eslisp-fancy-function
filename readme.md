# eslisp-fancy-function [![](https://img.shields.io/npm/v/eslisp-fancy-function.svg?style=flat-square)][1] [![](https://img.shields.io/travis/anko/eslisp-fancy-function.svg?style=flat-square)][2] [![](https://img.shields.io/badge/eslisp_chat-gitter_%E2%86%92-blue.svg?style=flat-square)][3]

<!-- !test program
sed 's/(require "eslisp-fancy-function")/(require "..\\/..\\/..\\/index.js")/' \
| ./node_modules/.bin/eslc \
| head -c -1
-->

An [eslisp][4] macro that works like an the usual `lambda` expression macro but
also

-   parses *splats* (atoms starting with `...`) in the arguments and turns them
    into appropriate variable assignments prepended to the function body, and
-   implicitly returns the last thing in the body if it's an expression.

Note that despite the name, this module is strictly a *function expressions*
(`lambda`-ish) macro, not a function declaration.  I'll rearrange that
eventually.

## Example

<!-- !test in example -->

    (macro fun (require "eslisp-fancy-function"))
    (fun (a b ...c d) (* a b d))

↓

<!-- !test out example -->

    (function (a, b) {
        var c = Array.prototype.slice.call(arguments, 2, -1);
        var d = arguments[arguments.length - 1];
        return a * (b * d);
    });

See [the tests][5] for fuller usage.

## License

[ISC][6].

[1]: https://www.npmjs.com/package/eslisp-fancy-function
[2]: https://travis-ci.org/anko/eslisp-fancy-function
[3]: https://gitter.im/anko/eslisp
[4]: https://www.npmjs.com/package/eslisp
[5]: test.esl
[6]: http://opensource.org/licenses/ISC
