#!/usr/bin/python

import sys, os

# meld, diffuse, bcompare
os.system('diffuse "%s" "%s"' % (sys.argv[2], sys.argv[5]))
