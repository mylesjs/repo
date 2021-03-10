default:
	# 1. Process yacc grammar file 
	yacc -d calc.y
	
	# 2. Process the lex specification file
	lex calc.l

	# 3. Compile and link to program name calc
	cc y.tab.c lex.yy.c -o calc

	# 4. Run calc program
	./calc
