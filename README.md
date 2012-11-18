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
with the Brainfuck source string in argument to run a program.

Example:

    require 'brainfuck' '++++++++++[>+++++++>++++++++++>+++>+<<<<-]>++.>+.+++++++..+++.>++.<<+++++++++++++++.>.+++.------.--------.>+.>.'

This obviously outputs the usual `Hello World!` message.

Confirming to the Brainfuck language specifications, any character except `+ - < > [ ] . ,` is treated as comment.

Morse syntax
------------

As an innovation, LuaBrainFuck supports a form of Morse code syntax for the Brainfuck program.

This enables a more unified syntax where only three characters (well, nearly) are needed to program.
These characters are without surprise `-` (or `_`), `.` and `/`.

To support Morse code syntax, you need to first call `require "morse"` or to run Lua with `-l morse`
in the command line. 

That modules returns a table with currently only one helper function: `export`. 

Most importantly, the module sets during loading 4 global variables: `_`, `__`, and `___`, `____`.

The `___` (3 underscores) function is the main one: it runs the Morse encoded Brainfuck program. 
The argument can be a plain Morse string as showed in this `Hello World!` example:

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
division and concatenation operations. 

Note: due to a limitation in Lua compiler, the number of `..` (concatenation) operations is limited to 200 per program.

### Lookup table

Here is the equivalence between Brainfuck instructions and Morse encoding used in the module. 
For readibility, it uses dash signs and not underscores. A division sign is required to separate
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







Copyright
---------

The module files are copyrighted by Patrick Rapin and placed under MIT license.

The "99-bottles" source code and derived forms are copyrighted by Raphael Bois and placed under GPL v2.
