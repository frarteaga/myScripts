#!/usr/bin/python

import sys
import math
from pyecm import factors as Factors

def factors(n):
	f_veb = False
	f_ra = False
	f_pr = 1

	f_ov = 2 * math.log(math.log(n))
	return Factors(n, f_veb, f_ra, f_ov, f_pr)


if __name__ == '__main__':
	for n in sys.argv[1: ]:
		n = int(n)
		for f in factors(n):
			print f	
