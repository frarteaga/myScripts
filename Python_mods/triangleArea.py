#!/usr/bin/python

import sys
import math

def is_triangle(a, b, c):
	if a + b <= c:
		return False
	if b + c <= a:
		return False
	if c + a <= b:
		return False
	return True

if len(sys.argv) == 4: #sides length
	sides = [float(x) for x in sys.argv[1: ]]
	if not is_triangle(sides[0], sides[1], sides[2]):
		print 'Incorrect sides'
	else:
		per = sum(sides) / 2.0
		area = math.sqrt(per * (per - sides[0]) * (per - sides[1]) * (per - sides[2]))
		print area
elif len(sys.argv) == 7: #coordinates
	pass #FIXME
elif len(sys.argv) == 2: #file
	pass #FIXME
elif len(sys.argv) == 1: #stdin
	pass #FIXME
else: #error
	pass #FIXME
	
