LuaBrainFuck
============

LuaBrainFuck is a simple module to execute Brainfuck programs under Lua.

In addition to the traditional syntax, it supports Morse style and bracket style.

As an interesting by-product, both the Morse and bracket styles enable to turn any Brainfuck
program into a quine, that is into a program that outputs itself!

Traditional syntax
------------------

The module in `brainfuck.lua` contains a simple yet complete Brainfuck interpreter.

Unlike most Lua modules, `brainfuck.lua` returns a single **function** that you just call 
with the Brainfuck source string in argument in order to run a program.

Example:

    require 'brainfuck' '++++++++++[>+++++++>++++++++++>+++>+<<<<-]>++.>+.+++++++..+++.>++.<<+++++++++++++++.>.+++.------.--------.>+.>.'

This obviously outputs the usual `Hello World!` message.

Conforming to the Brainfuck language specifications, any character except `+ - < > [ ] . ,` is treated as a comment.

Morse syntax
------------

As an innovation, LuaBrainFuck supports a form of Morse code syntax for the Brainfuck program.

This enables a more unified syntax where only three characters (well, nearly) are needed to program.
These characters are without surprise the dash (`-`) (or the underscore `_`), the dot `.` and the oblic bar `/`.

To support Morse code syntax, you need to first call `require "morse"` or to run Lua with `-l morse`
on the command line. 

That modules returns a table with currently only one helper function: `export`. 

Most importantly, the module sets during loading 4 global variables: `_`, `__`, `___`, and `____`.

The `___` (3 underscores) function is the main one: it runs the Morse encoded Brainfuck program. 
The argument can be a plain Morse string as showed in this _Hello World_ example:

	___[[-.-/-.-/-.-/-.-/-.-/-.-/-.-/-.-/-.-/-.-/-..-/-.-.-/-.-/-.-/-.-/-.-/-.-/-.-/-.-/-.-.-/-.-/-.-/
	-.-/-.-/-.-/-.-/-.-/-.-/-.-/-.-/-.-.-/-.-/-.-/-.-/-.-.-/-.-/--.-/--.-/--.-/--.-/-.--/-..-.-/-.-.-/
	-.-/-.-/--.--/-.-.-/-.-/--.--/-.-/-.-/-.-/-.-/-.-/-.-/-.-/--.--/--.--/-.-/-.-/-.-/--.--/-.-.-/-.-/
	-.-/--.--/--.-/--.-/-.-/-.-/-.-/-.-/-.-/-.-/-.-/-.-/-.-/-.-/-.-/-.-/-.-/-.-/-.-/--.--/-.-.-/--.--/
	-.-/-.-/-.-/--.--/-.--/-.--/-.--/-.--/-.--/-.--/--.--/-.--/-.--/-.--/-.--/-.--/-.--/-.--/-.--/--.--/
	-.-.-/-.-/--.--/-.-.-/--.--]]
	
Since the program does not include a `require "morse"` instruction (which would look quite weird in a Morse
program), you must load the module from the command line:

    lua  -l morse  hello-world-morse-str.lua
	
Passing a string to `___` could be considered as cheating. That is why a pure Lua version is also
supported. For that, you need to use `_` (underscore) instead of `-` (dash) for the _dah_ sign. 
The same example becomes:

	___(_._/_._/_._/_._/_._/_._/_._/_._/_._/_._/_.._/_._._/_._/_._/_._/_._/_._/_._/_._/_._._/_._/_._/
	_._/_._/_._/_._/_._/_._/_._/_._/_._._/_._/_._/_._/_._._/_._/__._/__._/__._/__._/_.__/_.._._/_._._/
	_._/_._/__.__/_._._/_._/__.__/_._/_._/_._/_._/_._/_._/_._/__.__/__.__/_._/_._/_._/__.__/_._._/_._/
	_._/__.__/__._/__._/_._/_._/_._/_._/_._/_._/_._/_._/_._/_._/_._/_._/_._/_._/_._/__.__/_._._/__.__/
	_._/_._/_._/__.__/_.__/_.__/_.__/_.__/_.__/_.__/__.__/_.__/_.__/_.__/_.__/_.__/_.__/_.__/_.__/__.__/
	_._._/_._/__.__/_._._/__.__)

Yes, it actually works! The code uses `_` and `__` global variables, along with a bunch of Lua indexation, 
division and concatenation operations. The general form for a program is:

    ___(  CODE )

You can add spaces and newlines anywhere except between two underscores `__` or two dots `..`.

Note: due to a limitation in Lua compiler, the number of `..` (concatenation) operations is limited to 200 per program.

### Lookup table

Here is the equivalence table between Brainfuck instructions and Morse encoding. 
For readibility, it uses dash signs and not underscores. A division sign `/` is required to separate
instructions.

    +   -.-
	-   -.--
	>   -.-.-
	<   --.-
	[   -..-
	]   -..-.-
	.   --.--
	,   --..-
	
### Quine

A quine, according to Wikipedia definition, is a computer program which takes no input and produces a copy of its own source code as its only output.

Because of the nature of the implementation in `morse.lua`, it is straightforward to turn any valid program 
in the full Lua Morse form into a quine! For that, you just need to change the call to `___` into a call
to `____` (4 underscores), that is to add an underscore at the begninning of the program.

The output may differ from the source code with a few whitespaces. It is however guarantied that the output of the quine
is itself a perfect quine. Illustration:

	$ lua -l morse hello-world-morse.lua > out1.lua
	$ lua -l morse out1.lua > out2.lua
	$ diff out1.lua out2.lua
	
### Brainfuck to Morse conversion

The module function `morse.export` can be used to transform a valid Brainfuck into Morse syntax,
either in string or code versions. Here is its prototype:

	function morse.export(brainfuck_source, want_code_syntax)

The first argument is a string containing the Brainfuck program. The second is a Boolean value: if `true`
it outputs full Lua code, if `false` the string form. Example of usage:

	lua -l morse -e "print(morse.export([[ +-[] ]], true))" > out.lua
	
Bracket mode
------------

LuaBrainFuck also supports another syntax mode called _bracket_. This only uses parenthesis `()`, 
square brackets `[]`, braces `{}` and underscore `_` characters.

To support bracket code syntax, you need to first call `require "bracket"` or to run Lua with `-l bracket`
on the command line. 

Like `morse.lua` that modules returns a table with currently only one helper function: `export`. 

Most importantly, the module sets during loading 2 global variables: `_`, `__`.
You cannot use simultaneously Morse and bracket styles because both define the same global variables,
`_`, `__`, in an incompatible manner.

The _Hello World_ example now becomes:

	_()()()()()()()()()(){_}(_)()()()()()()()(_)()()()()()()()()()()(_)()()()(_)()[_][_][_][_]{
	}[__](_)()()(__)(_)()(__)()()()()()()()(__)(__)()()()(__)(_)()()(__)[_][_]()()()()()()()()(
	)()()()()()()(__)(_)(__)()()()(__){}{}{}{}{}{}(__){}{}{}{}{}{}{}{}(__)(_)()(__)(_)(__)(_,_)

It works perfectly if run this way:

	lua -l bracket hello-world.lua

As you have understood, this is a succession of function calls, sometimes with a literal table argument,
and indexations. The general form of a program is this:

    _  CODE (_,_)
	
Because of Lua 5.2 function disambigation, you can add spaces and newlines anywhere in the code except between two underscores `__`.
	
### Lookup table

Here is the equivalence table between Brainfuck instructions and bracket encoding used in the module. 

    +   ()
	-   {}
	>   (_)
	<   [_]
	[   {_}
	]   [__]
	.   (__)
	,   {__}

### Quine

Like Morse, the bracket syntax also supports to be turned into a quine. All you have to do for that is to
replace the final function call `(_,_)` by that function call `(_,__)`, that is to add an underscore
before the last parenthesis character.

The output may differ from the source code with a few whitespaces. It is however guarantied that the output of the quine
is itself a perfect quine. Illustration:

	$ lua -l bracket hello-world-bracket.lua > out1.lua
	$ lua -l bracket out1.lua > out2.lua
	$ diff out1.lua out2.lua
	
### Brainfuck to bracket conversion

The module function `bracket.export` can be used to transform a valid Brainfuck into bracket syntax.
Here is its prototype:

	function bracket.export(brainfuck_source)

The argument is a string containing the program. Example of usage:

	lua -l bracket -e "print(bracket.export[[ +-[] ]])" > out.lua

Copyright
---------

LuaBrainFuck source files are copyrighted by Patrick Rapin and placed under MIT license.

The "99-bottles" source code and derived forms are copyrighted by Raphael Bois and placed under GPL v2.
