#!/usr/bin/python

import sys
import string

l = 'lambda ' + sys.argv[1]
f = eval(l)

while 1:
	I = ''
	try:
		I = raw_input().split()
	except:
		break;
	O = filter(f, I)
	if O != []:
		print string.join(O, ' ') 

