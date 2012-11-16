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

As an innovation, LuaBrainFuck supports a form a Morse code for the Brainfuck program.

This enables a more unified syntax where only three characters (well, nearly) are needed to program.

To support Morse code syntax, you need to first call `require "morse"`. 

That modules returns a table with currently only helper function: `tomorse`. 
Most importantly, the module loading sets 3 global variables: `_`, `__`, and `___`.

The `___` function is the main one: it runs the morse encoded Brainfuck program. The argument is either
a plain Morse string as in this `Hello World!` example:

	___[[-.-/-.-/-.-/-.-/-.-/-.-/-.-/-.-/-.-/-.-/-..-/-.-.-/-.-/-.-/-.-/-.-/-.-/-.-/-.-/-.-.-/-.-/-.-/
	-.-/-.-/-.-/-.-/-.-/-.-/-.-/-.-/-.-.-/-.-/-.-/-.-/-.-.-/-.-/--.-/--.-/--.-/--.-/-.--/-..-.-/-.-.-/
	-.-/-.-/--.--/-.-.-/-.-/--.--/-.-/-.-/-.-/-.-/-.-/-.-/-.-/--.--/--.--/-.-/-.-/-.-/--.--/-.-.-/-.-/
	-.-/--.--/--.-/--.-/-.-/-.-/-.-/-.-/-.-/-.-/-.-/-.-/-.-/-.-/-.-/-.-/-.-/-.-/-.-/--.--/-.-.-/--.--/
	-.-/-.-/-.-/--.--/-.--/-.--/-.--/-.--/-.--/-.--/--.--/-.--/-.--/-.--/-.--/-.--/-.--/-.--/-.--/--.--/
	-.-.-/-.-/--.--/-.-.-/--.--]]
	