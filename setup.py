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
Setup script for example Python project
'''

import setuptools
try:
    from sphinx.setup_command import BuildDoc
    _cmdclass = {'build_sphinx': BuildDoc}
except ImportError:
    import warnings
    warnings.warn('"sphinx" is required to build the documentation',
                  category=ImportWarning)
    _cmdclass = {}


# Reuse README as long description
with open('README.md', 'r') as f:
    readme = f.read()


# Python installable package
setuptools.setup(
    name='kmhsonnenkind',
    version='0.0.1',
    description='Example Python project',
    long_description=readme,
    long_description_content_type='text/markdown',
    author='Martin Kloesch',
    author_email='martin.kloesch@gmail.com',
    url='https://github.com/kmhsonnenkind/python-example',
    license='MIT',
    project_urls={
        'Documentation': 'https://readthedocs.org/projects/kmhsonnenkind',
        'Version Control': 'https://github.com/kmhsonnenkind/python-example',
        'Issue Tracker': 'https://github.com/kmhsonnenkind/python-example/issues'
    },
    packages=['kmhsonnenkind'],
    entry_points={
        'console_scripts': [
            'kmhsonnenkind=kmhsonnenkind.__main__:main'
        ]
    },
    python_requires='>=3.6',
    install_requires=[],
    setup_requires=['pytest-runner', 'sphinx'],
    tests_require=['pytest'],
    cmdclass=_cmdclass,
    classifiers=[
        'Development Status :: 3 - Alpha',
        'Environment :: Console',
        'Intended Audience :: Developers',
        'License :: OSI Approved :: MIT License',
        'Natural Language :: English',
        'Programming Language :: Python :: 3.6',
        'Typing :: Typed'
    ]
)
