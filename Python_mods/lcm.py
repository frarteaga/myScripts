#!/usr/bin/python

import sys
#from gcd import gcd

def gcd(a, b):
	while b > 0:
		t = b
		b = a % b
		a = t
	return a

def lcm(a, b):
	return a / gcd(a, b) * b

if __name__ == '__main__':
	mcm = 1
	for x in sys.argv[1: ]:
		mcm = mcm / gcd(mcm, int(x)) * int(x)

	print mcm
