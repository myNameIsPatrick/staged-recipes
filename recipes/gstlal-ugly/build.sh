#!/bin/bash

# conda-forge/conda-forge.github.io#621
find ${PREFIX} -name "*.la" -delete

# only link libraries we actually use
export GSL_LIBS="-L${PREFIX}/lib -lgsl"
export GSTLAL_LIBS="-L${PREFIX}/lib -lgstlal -lgstlaltags -lgstlaltypes"

./configure \
  --prefix=${PREFIX} \
  --without-doxygen \
  --with-html-dir=$(pwd)/tmphtml

make -j ${CPU_COUNT}
make -j ${CPU_COUNT} install
