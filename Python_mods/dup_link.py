#!/usr/bin/python
#By FR

import sys
import commands
import os

#FIXME mejorar el tratamiento de las opcciones -q -k -m 
#FIXME m'as de una carpeta -R o no

cmd = 'fdupes -n -q -R ./'

if '-q' not in sys.argv:
	os.system('df -hm ./')

s = commands.getoutput(cmd) + '\n'

#print 'INFO: ', s

#print s.index('\n\n')

while 1:
	try:
		p = s[ : s.index('\n\n')].split('\n')
		s = s[s.index('\n\n') + 2 : ]
	except:
		#print 'INi)FO: ', p, s
		break
	for i in xrange(1, len(p)):
		try:
			os.remove(p[i])
		except:
			print p[i], '-- fichero borrado o permisos incorrectos'
		if '-d' not in sys.argv:
			try:
				os.link(p[0], p[i])
			except:
				print p[i], '-- fichero borrado o permisos incorrectos'
				

if '-q' not in sys.argv:
	os.system('df -hm ./')
