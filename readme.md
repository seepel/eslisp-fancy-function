# eslisp-fancy-function

An [eslisp][1] macro that works like an the usual `function` declaration macro
but also parses *splats* (atoms starting with `...`) in the arguments and turns
them into appropriate variable assignments prepended to the function body.

## Example

    (macro fun (require "/path/to/eslisp-fancy-function"))
    (fun (a b ...c d) ((. console log) c))

↓

    (function (a, b) {
        var c = Array.prototype.slice.call(arguments, 2, 3);
        var d = arguments[3];
        console.log(c);
    });

See [the tests][2] for fuller usage.

## License

[ISC][3].

[1]: https://www.npmjs.com/package/eslisp
[2]: test.esl
[3]: http://opensource.org/licenses/ISC
