#!/usr/bin/python

import sys
import string
import math
import itertools
from factors import factors

def prod(L):
	p = 1
	for x in L:
		p *= x
	return p

def phi(n):
	fs = set(factors(n))
	r = n / prod(fs)
	r *= prod(x - 1 for x in fs)
	return r

if __name__ == '__main__':
	if len(sys.argv) > 1:
		for n in sys.argv[1: ]:
			n = int(n)
			print n, ": ", phi(n)
	else:
		n = 0
		while 1:
			try:
				n = int(input())
			except:
				break
			print phi(n)


