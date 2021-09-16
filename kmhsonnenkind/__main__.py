#!/usr/bin/python3

# MIT License
#
# Copyright (c) 2021 Martin Kloesch
#
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in
# all copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
# SOFTWARE.

'''
Main script greeting person.
'''

import argparse

import kmhsonnenkind


def main():
    '''
    Main function greeting person.
    '''
    # Parse arguments
    parser = argparse.ArgumentParser(description='Greet person')
    parser.add_argument('name', metavar='<Name>', type=str,
                        help='Person to be greeted')
    parser.add_argument('-v', '--version', action='version',
                        version=f'{kmhsonnenkind.__version__}')
    args = parser.parse_args()

    # Call library function
    print(kmhsonnenkind.greet(args.name))


if __name__ == '__main__':
    main()
