#!/bin/bash

PREFIX_PATH=/home/soh/concolic_php

XXHASH_PATH=/home/soh/xxHash
XXHASH_CFLAGS="-I${XXHASH_PATH}/include"
XXHASH_LDFLAGS="-L${XXHASH_PATH}/lib"
XXHASH_LIBS="-Wl,-rpath,${XXHASH_PATH}/lib -L${XXHASH_PATH}/lib -lxxhash"

UCPHP_PATH=/home/soh/git/uc-php
UCPHP_CFLAGS="-I${UCPHP_PATH}/includes"
UCPHP_LDFLAGS="-L${UCPHP_PATH}"
UCPHP_LIBS="-L${UCPHP_PATH} -luc_php -Wl,-rpath,/home/soh/git/uc-php"
UCPHP2_LIBS="-L${UCPHP_PATH} -luc_php2 -Wl,-rpath,/home/soh/git/uc-php"

CFLAGS="${HASKELL_CFLAGS} ${XXHASH_CFLAGS} ${UCPHP_CFLAGS} -DDISABLE_STRING_INTERNING -ggdb3 --coverage"
LDFLAGS="${HASKELL_LDFLAGS} ${XXHASH_LDFLAGS} ${UCPHP_LDFLAGS} --coverage"
LIBS="${HASKELL_LIBS} ${XXHASH_LIBS} ${UCPHP_LIBS} ${UCPHP2_LIBS}"

./configure --prefix=${PREFIX_PATH} --enable-xdebug --with-php-config=/home/soh/concolic_php/bin/php-config CFLAGS="${CFLAGS}" LDFLAGS="${LDFLAGS}" LIBS="${LIBS}"
