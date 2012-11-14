bf = require 'brainfuck'

bf.run [=[
# 99 bottles of beer in Brainf*ck
# Copyright (C) 2008 Raphael Bois
# 1671 brainf*ck instructions.
# Published under GPL v2

Initialization
++    Counter for loop (a)
>+    unused
>++   Counter for loop (b)
>     Flag for 'no more'
>+    Flag for not 'no more'
>>>   (5) to (7) : temporary values
++++++++++[->+>+>++++++++++<<<]>>>    10 10 100 in (8) (9) (10)
>++++++++++   10 in (11)
[-
   >+++++           50  in (12)
   >++++++++++      100 in (13)
   >+++++++++++     110 in (14)
   >++++++++        80  in (15)
   >++++++++        80  in (16)
   >+++             30  in (17)
   >++++            40  in (18)
   >+               10  in (19)
   <<<<<<<<]
+
>-- +             48  '0'   plus 1 in (12)
>++ +             102 'f'   plus 1 in (13)
>+++++ +          115 's'   plus 1 in (14)
>-- +             78  'N'   plus 1 in (15)
>++++ +           84  'T'   plus 1 in (16)
>++ +             32  ' '   plus 1 in (17)
>++++ +           44  comma plus 1 in (18)
> +               10  LF    plus 1 in (19)

stuff for writing parts of the song
>+   select stuff
>+   select stuff
>+   write song part 3
>++  write song part 1
>+   write song part 2
>+   Flag for 'end of song'
>++  Flag for not 'end of song'

All bytes are at val plus 1
Go back to (7) with final initialization step (remove 1 to all bytes)
[-<]

<<<<<<< at (0)
[ loop (a)
-

>> at (2)
[ loop (b)

  >>>>>>>> at (10)
  [ start loop

    <<<<<<< at (3)
    [->[-]
      print '(N|n)o more'
      >>>>>>>>>>>.  '(N|n)'
      <----.        'o'
      >>>.          ' '
      <<<--.        'm'
      ++.           'o'
      +++.+         'r'
      <-.+          'e'
      <<+<<<<<<<<
    ]+> at (4)
    [-<[-]>>>>> at (9)
      prints number (using (9) and (10))
      [>>>+<<<<+<+<+>>>-]<<<[->>>+<<<]> at (6)
      [>>>>>>+<<<<<<-]>>>>>[[-]>.<]<<<<[>>>>>-<<<<<-]>> at (9)
      [<<+<+<+>>>>-]<<<<[->>>>+<<<<]> at (6)
      [>>>>>>+<<<<<<-]>>>>>>.<<<<<[>>>>>-<<<<<-] at (7)

      memorize in (11) if (10) not 1
      >>>[-<<<+<+>>>>]<<<<[->>>>+<<<<]>-[[-]>>>>+<<<<]<<< at (4)
    ]+

    >>>>>>>> at (12)
    print ' bottle(s) of beer'
    >>>>>.      ' '
    <<<<----.    'b'
    >----.       'o'
    +++++..-     'tt'
    <++++++++++. 'l'
    -------.     'e'
    <<[[-]>>>.<<<]>> 's' if (11)==1 ie if (10)!=1
    >>>>.        ' '
    <<<----.     'o'
    <+.          'f'
    >>>>.        ' '
    <<<<----.    'b'
    +++..+       'ee'
    >+++.+       'r'

    [>] at (20)

    +>+>[->+<<-<-
         print ' on the wall' DOT LF LF
         <<<.            ' '
         <<<----.        'o'
         -.              'n'
         >>>.            ' '
         <<<++++++.      't'
         <++.            'h'
         ---.            'e'
         >>>>.           ' '
         <<<+++.         'w'
         <----.          'a'
         +++++++++++..   'll'
         ------>----     reset to 'f' and 's'
         >---------- ---------- ---------- -- sets (15) to 'N'

         >>>++.--  DOT
         >..       LF LF
    >>>] at (22)

    >>>[->[-]<<<<<<<[<]<[-]>>[>]>>>>>]+ if end of song reset bottles counter
    >[-<[-] at (25)
      <<<< at (21)
      [->>[->+<<<<-
           print ' on the wall' COMMA ' '
           <<<.            ' '
           <<<----.        'o'
           -.              'n'
           >>>.            ' '
           <<<++++++.      't'
           <++.            'h'
           ---.            'e'
           >>>>.           ' '
           <<<+++.         'w'
           <----.          'a'
           +++++++++++..   'll'

           ------>----     reset (13) and (14) to 'f' and 's'
           >++++++++++ ++++++++++ ++++++++++ ++ sets (15) to 'n'

           >>>.            comma
           <.              ' '
      >>>>>>]<<]< at (20)

      [->>>>[-<<+< at (21)
             <<<++.--       DOT
             >.             LF

             [<]<<<<<<<< at (3)
             [->[-]<]+>  at (4)
             [-<[-]>
               >>>>>>>>>>>>.  'T'
               <<<-----.      'a'
               ++++++++++.    'k'
               ------.        'e'
               >>>>.          ' '
               <<<----.       'o'
               -.             'n'
               <.             'e'
               >>>>.          ' '
               <<<<-.         'd'
               >+.            'o'
               ++++++++.      'w'
               ---------.     'n'
               >>>.           ' '
               <<<<---.       'a'
               >.             'n'
               <+++.          'd'
               >>>>.          ' '
               <<<++.         'p'
               <---.          'a'
               >+++..         'ss'
               >>>.           ' '
               <<<<++++++++.  'i'
               >+.            't'
               >>>.           ' '
               <<<<--------.  'a'
               >--.           'r'
               ---.           'o'
               ++++++.        'u'
               -------.       'n'
               <+++.          'd'
               ++>+++++       reset (13) and (14) to 'f' and 's'
               >>>>.          comma
               <.             ' '

               [<]<<<<<<< at (4)
             ]+

            >>>>>> at (10)
            decrements values
            -<<<+>>[<<[-]<+<+>>>>-]<<<<[>-<[-]]>[->>>+<<<]>[->->+++++++++<<]>>> at (10)

         >>[>]>>>>] at (24)
      <<<<] at (20)

    >>>>>>]+ at (26)

    <<<<<<<[<]< at (10)
  ]
  +<+
  <<<<<<+< at (2)
  -
]

print 'Go to the store and buy some more' comma ' '

  >>>>>>>>>>[>]>>>>> at (25)
  [->[-]<]+> at (26)
  [-<[-]
    <<<<<<<<< at (16)
    -------------.   'G'
    <<----.          'o'
    >>>.             ' '
    <<<+++++.        't'
    -----.           'o'
    >>>.             ' '
    <<<+++++.        't'
    <++.             'h'
    ---.             'e'
    >>>>.            ' '
    <<<-.            's'
    +.               't'
    -----.           'o'
    +++.             'r'
    <.               'e'
    >>>>.            ' '
    <<<<----.        'a'
    >----.           'n'
    <+++.            'd'
    >>>>.            ' '
    <<<<--.          'b'
    >+++++++.        'u'
    ++++.            'y'
    >>>.             ' '
    <<<------.       's'
    ----.            'o'
    --.              'm'
    <+++.            'e'
    >>>>.            ' '
    <<<.             'm'
    ++.              'o'
    +++.+            'r'
    <.+              'e'
    >>>>>.           coma
    <.               ' '
    >>>>>>>>>
  ]+

  Initialize last loop to print final '99 bottles of beer on the wall' DOT
  <[-]+<[-]<[-]<[-]+<<< at (19)
  [<]<[-]<[-]<[-]<[-] at (7)
  ++++++++++[->+>+>++++++++++<<<]>->->-
  <<<<<<[-]+<[-]<+<< at (0)
]
]=]
