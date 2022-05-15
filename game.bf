board:
	X X X
	O O O
	X X X

lastPos: minus 3

tape:
	static mem: minus 1 | 0
	null byte           | 1
	register 0          | 2
	register 1          | 3
	user input          | 4
	' ' (32)            | 5
	'X' (88)            | 6
	'O' (79)            | 7
	'\n' (10)           | 8

	board: minus 2      | 9
	null byte           | 10
	    is ' '
	9 x is 'X'
	    is 'O'  

tape: {minus 1; 0; r0; r1; user input; ' '; 'X'; 'O'; '\n'; minus 2; 0; (is ' '; is 'X'; is 'O') x 9}

init memory

	- set c0 flag
	> set c1 to null byte
	> set c2 to register 0
	> set c3 to register 1
	> set c4 to user input
	>>+++++[<++++++>-]<++ set c5 to ' '
	>>+++++++++[<++++++++++>-]<-- set c6 to 'X'
	>>+++++++++[<+++++++++>-]<-- set c7 to 'O'
	>++++++++++ set c8 to '\n'
	>-- set c9 to board flag
	> set c10 to null byte
	> +>>> +>>> +>>> +>>> +>>> +>>> +>>> +>>> >+>> write all positions to ' '
	+[-<+]-> go to beginning

show board
	+[- loop
	++[-->++]-- go to beginning of board

	>>  [+[-<+]->>>>>  .++[-->++]-->]++[--<++]-- print ' ' if is empty
	>> >[+[-<+]->>>>>> .++[-->++]-->]++[--<++]-- print 'X' if is X
	>>>>[+[-<+]->>>>>>>.++[-->++]-->]++[--<++]-- print 'O' if is O
	+[-<+]->>>>>.++[-->++]-- print ' '
	>>>>>  [+[-<+]->>>>>  .++[-->++]-->]++[--<++]-- print ' ' if is empty
	>>>>> >[+[-<+]->>>>>> .++[-->++]-->]++[--<++]-- print 'X' if is X
	>>>>>>>[+[-<+]->>>>>>>.++[-->++]-->]++[--<++]-- print 'O' if is O
	+[-<+]->>>>>.++[-->++]-- print ' '
	>>>>>>>>  [+[-<+]->>>>>  .++[-->++]-->]++[--<++]-- print ' ' if is empty
	>>>>>>>> >[+[-<+]->>>>>> .++[-->++]-->]++[--<++]-- print 'X' if is X
	>>>>>>>>>>[+[-<+]->>>>>>>.++[-->++]-->]++[--<++]-- print 'O' if is O
	+[-<+]->>>>>>>>.++[-->++]-- print '\n'

	>>>>>>>>>>>  [+[-<+]->>>>>  .++[-->++]-->]++[--<++]-- print ' ' if is empty
	>>>>>>>>>>> >[+[-<+]->>>>>> .++[-->++]-->]++[--<++]-- print 'X' if is X
	>>>>>>>>>>>>>[+[-<+]->>>>>>>.++[-->++]-->]++[--<++]-- print 'O' if is O
	+[-<+]->>>>>.++[-->++]-- print ' '
	>>>>>>>>>>>>>>  [+[-<+]->>>>>  .++[-->++]-->]++[--<++]-- print ' ' if is empty
	>>>>>>>>>>>>>> >[+[-<+]->>>>>> .++[-->++]-->]++[--<++]-- print 'X' if is X
	>>>>>>>>>>>>>>>>[+[-<+]->>>>>>>.++[-->++]-->]++[--<++]-- print 'O' if is O
	+[-<+]->>>>>.++[-->++]-- print ' '
	>>>>>>>>>>>>>>>>>  [+[-<+]->>>>>  .++[-->++]-->]++[--<++]-- print ' ' if is empty
	>>>>>>>>>>>>>>>>> >[+[-<+]->>>>>> .++[-->++]-->]++[--<++]-- print 'X' if is X
	>>>>>>>>>>>>>>>>>>>[+[-<+]->>>>>>>.++[-->++]-->]++[--<++]-- print 'O' if is O
	+[-<+]->>>>>>>>.++[-->++]-- print '\n'

	>>>>>>>>>>>>>>>>>>>>  [+[-<+]->>>>>  .++[-->++]-->]++[--<++]-- print ' ' if is empty
	>>>>>>>>>>>>>>>>>>>> >[+[-<+]->>>>>> .++[-->++]-->]++[--<++]-- print 'X' if is X
	>>>>>>>>>>>>>>>>>>>>>>[+[-<+]->>>>>>>.++[-->++]-->]++[--<++]-- print 'O' if is O
	+[-<+]->>>>>.++[-->++]-- print ' '
	>>>>>>>>>>>>>>>>>>>>>>>  [+[-<+]->>>>>  .++[-->++]-->]++[--<++]-- print ' ' if is empty
	>>>>>>>>>>>>>>>>>>>>>>> >[+[-<+]->>>>>> .++[-->++]-->]++[--<++]-- print 'X' if is X
	>>>>>>>>>>>>>>>>>>>>>>>>>[+[-<+]->>>>>>>.++[-->++]-->]++[--<++]-- print 'O' if is O
	+[-<+]->>>>>.++[-->++]-- print ' '
	>>>>>>>>>>>>>>>>>>>>>>>>>>  [+[-<+]->>>>>  .++[-->++]-->]++[--<++]-- print ' ' if is empty
	>>>>>>>>>>>>>>>>>>>>>>>>>> >[+[-<+]->>>>>> .++[-->++]-->]++[--<++]-- print 'X' if is X
	>>>>>>>>>>>>>>>>>>>>>>>>>>>>[+[-<+]->>>>>>>.++[-->++]-->]++[--<++]-- print 'O' if is O
	+[-<+]->>>>>>>>.++[-->++]-- print '\n'

place board

	get input in range 0 to 8
		-[[+ loop until valid input given
		+[-<+]->>> go to not range flag
		[-] reset not range flag
		>, get user input

		<+++++++[>-------<-]> change from ascii to int 
		[<+<+>>-]<[>+<-]> copy input to r0

		[-[-[-[-[-[-[-[-[ check if in range 0 to 8
			<+if not write not range flag
			<< go to null byte
		]]]]]]]]] endif

		+[-<+]->>>> go to user input
		[-] zero out user input
		<<[>>+<<-]>> copy r0 to user input

		< go to not range flag
		] loop again if input was not valid

	check if is empty
		>[<<+>+>-]<[>+<-] copy input to r0
		+>  write nr (not read) flag

		[-[-[-[-[-[-[-[- check number
		<[++[-->++]-->> >>> >>> >>> >>> >>> >>> >>> >>> [+[-<+]->+>>>] +[-<+]->>>-]>] if nr check pos 8 is empty 
		<[++[-->++]-->> >>> >>> >>> >>> >>> >>> >>>     [+[-<+]->+>>>] +[-<+]->>>-]>] if nr check pos 7 is empty
		<[++[-->++]-->> >>> >>> >>> >>> >>> >>>         [+[-<+]->+>>>] +[-<+]->>>-]>] if nr check pos 6 is empty
		<[++[-->++]-->> >>> >>> >>> >>> >>>             [+[-<+]->+>>>] +[-<+]->>>-]>] if nr check pos 5 is empty
		<[++[-->++]-->> >>> >>> >>> >>>                 [+[-<+]->+>>>] +[-<+]->>>-]>] if nr check pos 4 is empty
		<[++[-->++]-->> >>> >>> >>>                     [+[-<+]->+>>>] +[-<+]->>>-]>] if nr check pos 3 is empty
		<[++[-->++]-->> >>> >>>                         [+[-<+]->+>>>] +[-<+]->>>-]>] if nr check pos 2 is empty
		<[++[-->++]-->> >>>                             [+[-<+]->+>>>] +[-<+]->>>-]>] if nr check pos 1 is empty
		<[++[-->++]-->>                                 [+[-<+]->+>>>] +[-<+]->>>-]>  if nr check pos 1 is empty

		<<[>>+<<-]< copy r0 back to input

		-] make sure flag was set

        >>+> write nw (not written) flag
        [-[-[-[-[-[-[-[- check number
        <[++[-->++]-->> >>> >>> >>> >>> >>> >>> >>> >>> [-]>[-]+>[-] +[-<+]->>>-]>] if nw overwrite pos 8 with 'X' 
        <[++[-->++]-->> >>> >>> >>> >>> >>> >>> >>>     [-]>[-]+>[-] +[-<+]->>>-]>] if nw overwrite pos 7 with 'X' 
        <[++[-->++]-->> >>> >>> >>> >>> >>> >>>         [-]>[-]+>[-] +[-<+]->>>-]>] if nw overwrite pos 6 with 'X' 
        <[++[-->++]-->> >>> >>> >>> >>> >>>             [-]>[-]+>[-] +[-<+]->>>-]>] if nw overwrite pos 5 with 'X' 
        <[++[-->++]-->> >>> >>> >>> >>>                 [-]>[-]+>[-] +[-<+]->>>-]>] if nw overwrite pos 4 with 'X' 
        <[++[-->++]-->> >>> >>> >>>                     [-]>[-]+>[-] +[-<+]->>>-]>] if nw overwrite pos 3 with 'X' 
        <[++[-->++]-->> >>> >>>                         [-]>[-]+>[-] +[-<+]->>>-]>] if nw overwrite pos 2 with 'X' 
        <[++[-->++]-->> >>>                             [-]>[-]+>[-] +[-<+]->>>-]>] if nw overwrite pos 1 with 'X' 
        <[++[-->++]-->>                                 [-]>[-]+>[-] +[-<+]->>>-]>  if nw overwrite pos 0 with 'X'
	+]-
