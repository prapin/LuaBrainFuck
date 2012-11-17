LuaBrainFuck
============

LuaBrainFuck is a simple module to execute Brainfuck programs under Lua.

In addition to the traditional syntax, it supports Morse style and parentheses style.

Traditional syntax
------------------

The module in `brainfuck.lua` contains a simple yet complete Brainfuck interpreter.

Unlike most Lua modules, `brainfuck.lua` returns a single **function** that you just call 
with the Brainfuck source string in argument to run a program.

Example:

    require 'brainfuck' '++++++++++[>+++++++>++++++++++>+++>+<<<<-]>++.>+.+++++++..+++.>++.<<+++++++++++++++.>.+++.------.--------.>+.>.'

This obviously outputs the usual `Hello World!` message.

Confirming to the Brainfuck language specifications, any character except `+ - < > [ ] . ,` are treated as comment.

Morse syntax
------------

As an innovation, LuaBrainFuck supports a form of Morse code for the Brainfuck program.

This enables a more unified syntax where only three characters (well, nearly) are needed to program.
These characters are without surprise `-` (or `_`), `.` and `/`.

To support Morse code syntax, you need to first call `require "morse"`. 

That modules returns a table with currently only helper function: `tomorse`. 
Most importantly, the module sets at loading 3 global variables: `_`, `__`, and `___`.

The `___` function is the main one: it runs the morse encoded Brainfuck program. The argument is either
a plain Morse string as in this `Hello World!` example:

	___[[-.-/-.-/-.-/-.-/-.-/-.-/-.-/-.-/-.-/-.-/-..-/-.-.-/-.-/-.-/-.-/-.-/-.-/-.-/-.-/-.-.-/-.-/-.-/
	-.-/-.-/-.-/-.-/-.-/-.-/-.-/-.-/-.-.-/-.-/-.-/-.-/-.-.-/-.-/--.-/--.-/--.-/--.-/-.--/-..-.-/-.-.-/
	-.-/-.-/--.--/-.-.-/-.-/--.--/-.-/-.-/-.-/-.-/-.-/-.-/-.-/--.--/--.--/-.-/-.-/-.-/--.--/-.-.-/-.-/
	-.-/--.--/--.-/--.-/-.-/-.-/-.-/-.-/-.-/-.-/-.-/-.-/-.-/-.-/-.-/-.-/-.-/-.-/-.-/--.--/-.-.-/--.--/
	-.-/-.-/-.-/--.--/-.--/-.--/-.--/-.--/-.--/-.--/--.--/-.--/-.--/-.--/-.--/-.--/-.--/-.--/-.--/--.--/
	-.-.-/-.-/--.--/-.-.-/--.--]]
	
But passing a string to `___` could be considered as cheating. That is why a pure Lua version is also
supported. For that, you need to use `_` instead of `-` for the long sign. The same example:

	___(_._/_._/_._/_._/_._/_._/_._/_._/_._/_._/_.._/_._._/_._/_._/_._/_._/_._/_._/_._/_._._/_._/_._/
	_._/_._/_._/_._/_._/_._/_._/_._/_._._/_._/_._/_._/_._._/_._/__._/__._/__._/__._/_.__/_.._._/_._._/
	_._/_._/__.__/_._._/_._/__.__/_._/_._/_._/_._/_._/_._/_._/__.__/__.__/_._/_._/_._/__.__/_._._/_._/
	_._/__.__/__._/__._/_._/_._/_._/_._/_._/_._/_._/_._/_._/_._/_._/_._/_._/_._/_._/__.__/_._._/__.__/
	_._/_._/_._/__.__/_.__/_.__/_.__/_.__/_.__/_.__/__.__/_.__/_.__/_.__/_.__/_.__/_.__/_.__/_.__/__.__/
	_._._/_._/__.__/_._._/__.__)

Yes, it actually works! This is only a bunch of Lua indexation, division and concatenation operations. 

Note: due to a limitation in Lua compiler, the number of `..` (concatenation) is limited to 200 per program.