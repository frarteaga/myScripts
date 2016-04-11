#!/usr/bin/python

import sys
import string

def apply_fr(f, L):
	for x in L:
		yield f(x)

l = 'lambda ' + sys.argv[1]
f = eval(l)

while 1:
	I = ''
	try:
		I = raw_input().split()
	except:
		break;
	O = list(apply_fr(f, I))
	if O != []:
		print string.join(O, ' ') 

