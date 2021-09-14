######################
Python Example Project
######################

.. toctree::
   :maxdepth: 2
   :caption: Contents:

This project offers a dummy Python library :mod:`kmhsonnenkind` that is used to in the
`Python Example Project <https://github.com/kmhsonnenkind/python-example>`__ to show how to set up a Python project on `github <https://github.com>`__ and
perform common CI / CD tasks like deploying to `PyPI <https://pypi.org>`__ or `Read the Docs <https://readthedocs.org>`__.


************
Installation
************

The package is available on `PyPI <https://pypi.org/project/kmhsonnenkind>`__ and can be installed using `pip <https://pypi.org/project/pip/>`__:

.. code-block:: sh

    ~$ python -m pip install kmhsonnenkind


Alternatively you can also install it directly from source:

.. code-block:: sh

    ~$ git clone https://github.com/kmhsonnenkind/python-example.git
    ~/python-example$ cd python-example
    ~/python-example$ python setup.py install


After installation the Python library :mod:`kmhsonnenkind` as well as the command line tool :code:`kmhsonnenkind` will be available.


*****
Usage
*****

The provided functionality can either be used via the :mod:`kmhsonnenkind` Python library or the :code:`kmhsonnenkind` command line tool.


In Script
=========

To use the library in the script simply import :mod:`kmhsonnenkind` and call its functionality.

.. code-block:: python

    import kmhsonnenkind
    print(kmhsonnenkind.greet('Martin'))


From Command Line
=================

Alternatively you can also call the :code:`kmhsonnenkind` command line tool with a required input parameter :code:`name`:

.. code-block:: sh

    ~$ kmhsonnenkind Martin


***********************************
:code:`kmhsonnenkind` Documentation
***********************************

.. automodule:: kmhsonnenkind
  :members:
