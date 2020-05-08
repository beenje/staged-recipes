#!/bin/bash

if [ "$PY3K" = "1" ]
then
  PYTHON_FLAGS="PYTHON_VERSION=3"
else
  PYTHON_FLAGS=""
fi

make distclean
echo "Generate RELEASE.local and CONFIG_SITE.local"
make configure EPICS_BASE=${EPICS_BASE} BOOST_ROOT=${PREFIX} ${PYTHON_FLAGS}

echo "Generated RELEASE.local"
cat configure/RELEASE.local
echo "Generated CONFIG_SITE.local"
cat configure/CONFIG_SITE.local

echo "Build pvaPy library"
make

echo "Install pvaccess.so"
mv lib/python/${PY_VER}/${EPICS_HOST_ARCH}/pvaccess.so ${STDLIB_DIR}/lib-dynload/
