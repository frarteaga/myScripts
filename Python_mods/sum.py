#!/usr/bin/python

N = 0
Sum = 0

while 1:
	try:
		N = input()
	except:
		break
	Sum += int(N)

print Sum
