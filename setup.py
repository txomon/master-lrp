__author__ = 'javier'


from setuptools import setup

setup(
    name="master-lrp",
    version="0.1",
    scripts=['practica2/practica2.py'],
    install_requires=[
        'control>=0.6.6'
    ]
)
