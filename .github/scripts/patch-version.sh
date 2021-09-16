#!/bin/bash

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
# The above copyright notice and this permission notice shall be included in all
# copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
# SOFTWARE.

###############################################################################
# Utility script patching version string in:
#     * setup.py for package version (e.g. used by PyPI)
#     * kmhsonnenkind/__init__.py for calls to __version__ from code
#     * docs/conf.py for the documentation (e.g. on ReadTheDocs)
#
# Usage: ./patch-version.sh 0.1.2
#
# Inspired by https://github.com/grst/python-ci-versioneer
###############################################################################


# Semantic version regex from: https://semver.org/#is-there-a-suggested-regular-expression-regex-to-check-a-semver-string
SEMVER="^(?P<major>0|[1-9]\d*)\.(?P<minor>0|[1-9]\d*)\.(?P<patch>0|[1-9]\d*)(?:-(?P<prerelease>(?:0|[1-9]\d*|\d*[a-zA-Z-][0-9a-zA-Z-]*)(?:\.(?:0|[1-9]\d*|\d*[a-zA-Z-][0-9a-zA-Z-]*))*))?(?:\+(?P<buildmetadata>[0-9a-zA-Z-]+(?:\.[0-9a-zA-Z-]+)*))?$"


# Target version from command line, must be valid semantic version
if [ $# -ne 1 ]
then
  echo "usage: ./patch-version <VERSION>"
  exit 1
fi
VERSION=$1
if ! echo ${VERSION} | grep -P ${SEMVER} 2>&1 1>/dev/null ;
then
  echo "invalid version \"${VERSION}\" - must be semantic version"
  exit 1
fi


# In- / output files relative to this directory
_THIS_DIRECTORY=$(cd -P -- "$(dirname -- "${BASH_SOURCE[0]}")" 2>&1 1>/dev/null && pwd -P)
_ROOT_DIRECTORY=$(realpath "${_THIS_DIRECTORY}/../..")
SETUP_PY=$(realpath "${_ROOT_DIRECTORY}/setup.py")
INIT_PY=$(realpath "${_ROOT_DIRECTORY}/kmhsonnenkind/__init__.py")
CONF_PY=$(realpath "${_ROOT_DIRECTORY}/docs/conf.py")


# Sanity checks that files contain development version
DEVELOPMENT_TAG=development
if ! grep -E "\s*,?\sversion\s*=\s*(['\"])${DEVELOPMENT_TAG}\1" "${SETUP_PY}" 2>&1 1>/dev/null ;
then
  echo "invalid version in setup.py"
  exit 1
fi
if ! grep -E "^__version__\s*=\s*(['\"])${DEVELOPMENT_TAG}\1" "${INIT_PY}" 2>&1 1>/dev/null ;
then
  echo "invalid version in kmhsonnenkind/__init__.py"
  exit 1
fi
if ! grep -E "^release\s*=\s*(['\"])${DEVELOPMENT_TAG}\1" "${CONF_PY}" 2>&1 1>/dev/null ;
then
  echo "invalid version in docs/conf.py"
  exit 1
fi

# Actual version update
if ! sed -i "s/\(\s*\)\(,\?\)\(\s*\)version\s*=\s*\(['\"]\)${DEVELOPMENT_TAG}\4/\1\2\3version='${VERSION}'/g" "${SETUP_PY}" ;
then
  echo "could not patch version in setup.py"
  exit 1
fi
if ! sed -i "s/^__version__\s*=\s*\(['\"]\)${DEVELOPMENT_TAG}\1/__version__ = '${VERSION}'/g" "${INIT_PY}" ;
then
  echo "could not patch version in kmhsonnenkind/__init__.py"
  exit 1
fi
if ! sed -i "s/^release\s*=\s*\(['\"]\)${DEVELOPMENT_TAG}\1/release = '${VERSION}'/g" "${CONF_PY}" ;
then
  echo "could not patch version in docs/conf.py"
  exit 1
fi
