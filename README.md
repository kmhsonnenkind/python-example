# Python Example Project

[![GitHub](https://img.shields.io/github/license/kmhsonnenkind/python-example)](https://github.com/kmhsonnenkind/python-example/blob/main/LICENSE)
[![Build](https://github.com/kmhsonnenkind/python-example/actions/workflows/ci.yml/badge.svg?branch=main)](https://github.com/kmhsonnenkind/python-example/actions/workflows/ci.yml)
[![Codecov](https://codecov.io/gh/kmhsonnenkind/python-example/branch/main/graph/badge.svg?token=hepKnpsQf0)](https://codecov.io/gh/kmhsonnenkind/python-example)

## About

This project shows how to host a Python project on [github](https://github.com) and perform common tasks like continuous integration or deployment.


## Installation

The package is available on [PyPI](https://pypi.org/project/kmhsonnenkind) and can be installed using [pip](https://pypi.org/project/pip):

```sh
python -m pip install kmhsonnenkind
```

Alternatively you can also install it directly from source:

```sh
git clone https://github.com/kmhsonnenkind/python-example.git
cd python-example
python setup.py installs
```

After installation the Python library `kmhsonnenkind` as well as the command line tool `kmhsonnenkind` will be available.


## Usage

The provided functionality can either be used via the `kmhsonnenkind` Python library or the `kmhsonnenkind` command line tool.

### In Script

To use the library in the script simply import `kmhsonnenkind` and call its functionality.

```py
import kmhsonnenkind
print(kmhsonnenkind.greet('Martin'))
```

### From Command Line

Alternatively you can also call the `kmhsonnenkind` command line tool with a required input parameter `name`:

```sh
kmhsonnenkind Martin
kmhsonnenkind Martin --email="martin@example.com"
```


## Further Documentation

For further documentation please check out [Read the Docs](https://kmhsonnenkind-python-example.readthedocs.io/).
