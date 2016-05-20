#!/usr/bin/env python
import sys
from __future__ import print_function

def parse(data):
    name, seq = None, []
    for line in data:
        line = line.rstrip()
        if line.startswith('>'):
            if name:
                yield (name, ''.join(seq))
            name, seq = line, []
        else:
            seq.append(line)
    if name:
        yield (name, ''.join(seq))


if __name__ == '__main__':
    for defline, seq in parse(sys.stdin):
        if len(seq) > 250000:
            print(defline)
            print(seq)
