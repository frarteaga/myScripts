#!/usr/bin/python

__author__ = "Frank Arteaga Salgado"

import sys

def gcd(a, b):
	'''Computes the Greatest Common Divisor of a and b using the standard quadratic time improvement to the Euclidean Algorithm.
Returns the GCD of a and b.'''
	if b == 0:
		return a
	elif a == 0:
		return b

	count = 0

	if a < 0:
		a = -a
	if b < 0:
		b = -b

	while not ((a & 1) | (b & 1)):
		count += 1
		a >>= 1
		b >>= 1

	while not a & 1:
		a >>= 1

	while not b & 1:
		b >>= 1

	if b > a:
		b,a = a,b

	while b != 0 and a != b:
		a -= b
		while not (a & 1):
			a >>= 1

		if b > a:
			b, a = a, b

	return a << count


if __name__ == '__main__':
	gcd_res = int(sys.argv[1])
	for x in sys.argv[2: ]:
		gcd_res = gcd(gcd_res, int(x))

	print gcd_res 
