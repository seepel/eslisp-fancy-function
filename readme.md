# eslisp-fancy-function

<!-- !test program
sed 's/(require "eslisp-fancy-function")/(require "..\\/..\\/..\\/index.js")/' \
| ./node_modules/.bin/eslc \
| head -c -1
-->

An [eslisp][1] macro that works like an the usual `function` expression macro
but also

-   parses *splats* (atoms starting with `...`) in the arguments and turns them
    into appropriate variable assignments prepended to the function body, and
-   implicitly returns the last thing in the body if it's an expression.

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

See [the tests][2] for fuller usage.

## License

[ISC][3].

[1]: https://www.npmjs.com/package/eslisp
[2]: test.esl
[3]: http://opensource.org/licenses/ISC
