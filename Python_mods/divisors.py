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

def divisors(n):
	fs = list(factors(n))
	groups = [] 
	i = 0
	while i < len(fs):
		g = [1, int(fs[i])]
		j = i + 1
		while j < len(fs) and fs[j] == fs[i]:
			g.append(int(fs[i]) * g[-1])
			j += 1
		groups.append(str(g))
		i = j
	r = []
	for div_fs in eval("itertools.product(" + string.join(groups, ',') + ")"):
		r.append(prod(div_fs))
	return r

if __name__ == '__main__':
	for n in sys.argv[1: ]:
		n = int(n)
		for div in divisors(n):
			print div
