#!/bin/bash -e

BOOST_DIR=~/dev/bgl_boost/
YASMIC_DIR=.

source ccfiles.sh
OFILES=`echo ${CCFILES} | sed -e 's/\.cc/\.o/g'`

CFLAGS="-O3 -arch x86_64 -DMATLAB_BGL_LARGE_ARRAYS -fPIC -c -I${BOOST_DIR} -I${YASMIC_DIR}"
#CFLAGS="-g -W -DMATLAB_BGL_LARGE_ARRAYS -fPIC -c -I${BOOST_DIR} -I${YASMIC_DIR}"

function echocmd {
    echo $@
    $@
}

for file in ${CCFILES}; do
 echocmd clang $CFLAGS $file
done

echocmd ar rcs libmbgl-macosx-intel-64-large.a ${OFILES}

echocmd rm ${OFILES}