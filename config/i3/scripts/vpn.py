#!/usr/bin/python3

import subprocess as sp

out = sp.run(['hostname', '-I'], stdout=sp.PIPE)

interface = str(out.stdout)

addr = interface.split(' ')

if len(addr) == 4:
    print(addr[1])
else:
    print('down')


