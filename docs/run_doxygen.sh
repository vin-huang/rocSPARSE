#!/bin/bash

if [ -d docBin ]; then
    rm -rf docBin
fi

sed -e 's/ROCSPARSE_EXPORT//g' ../library/include/rocsparse-functions.h > rocsparse-functions.h
sed -e 's/ROCSPARSE_EXPORT//g' ../library/include/rocsparse-auxiliary.h > rocsparse-auxiliary.h
sed -i 's/#include "rocsparse-export.h"//g' rocsparse-functions.h
cp ../library/include/rocsparse-types.h rocsparse-types.h
cp ../LICENSE.md .
doxygen Doxyfile
rm rocsparse-functions.h
rm rocsparse-auxiliary.h
rm rocsparse-types.h
rm LICENSE.md
