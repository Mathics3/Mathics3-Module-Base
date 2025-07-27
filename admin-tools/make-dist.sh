#!/bin/bash
PACKAGE=pymathics

# FIXME put some of the below in a common routine
function finish {
  cd $make_dist_pymathics_owd
}

cd $(dirname ${BASH_SOURCE[0]})
make_dist_pymathics_owd=$(pwd)
trap finish EXIT

cd ..
source $PACKAGE/version.py
echo $__version__

pip wheel --wheel-dir=dist .
python -m build --sdist
finish
