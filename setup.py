from setuptools import find_packages, setup

setup(
    name='datadispatch',
    version='1.0.0',
    author='Paul Baecher',
    description='Like functools.singledispatch but for values',
    long_description=open('README.md').read(),
    long_description_content_type='text/markdown',
    url='https://github.com/pb-/datadispatch',
    packages=find_packages(),
    classifiers=[
        'Programming Language :: Python :: 3',
        'License :: OSI Approved :: MIT License',
        'Operating System :: OS Independent',
    ],
)
