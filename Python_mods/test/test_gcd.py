import unittest
import gcd

class gcdTestCase(unittest.TestCase):

	primes = [2, 3, 5, 7, 11, 13, 17, 19]

	def testNN1(self):
		for N in xrange(30):
			self.assertEqual(gcd.gcd(N, N + 1), 1)
			self.assertTrue(1 <= gcd.gcd(N, N + 2) <= 2)

	def testPrimes(self):
		for x in self.primes:
			for y in self.primes:
				if x != y:
					self.assertEqual(gcd.gcd(x, y), 1)	
				else:
					self.assertEqual(gcd.gcd(x, y), x)

	def testSimple(self):
		self.assertEqual(gcd.gcd(12, 15), 3)
		self.assertEqual(gcd.gcd(8, 4), 4)
		self.assertEqual(gcd.gcd(30, 12), 6)
		self.assertEqual(gcd.gcd(100, 125), 25)

	def testBigNum(self):
		#two big prime numbers
		p = 100000000000657 
		q = 1000000000000783 
		self.assertEqual(gcd.gcd(p, q), 1)
		a = p * q * 41 * 31
		b = p * 1009 * 31
		self.assertEqual(gcd.gcd(a, b), p * 31)

if __name__ == '__main__':
	unittest.main()

