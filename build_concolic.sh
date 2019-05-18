#!/bin/bash

PREFIX_PATH=/home/soh/concolic_php

ZLOG_PATH=/home/soh/zlog
ZLOG_CFLAGS="-I${ZLOG_PATH}/include"
ZLOG_LDFLAGS="-L${ZLOG_PAHT}/lib"
ZLOG_LIBS="-Wl,-rpath,${ZLOG_PATH}/lib -L${ZLOG_PATH}/lib -lzlog -lpthread"

XXHASH_PATH=/home/soh/xxHash
XXHASH_CFLAGS="-I${XXHASH_PATH}/include"
XXHASH_LDFLAGS="-L${XXHASH_PATH}/lib"
XXHASH_LIBS="-Wl,-rpath,${XXHASH_PATH}/lib -L${XXHASH_PATH}/lib -lxxhash"

REDIS_PATH=/home/soh/hiredis
REDIS_CFLAGS="-I${REDIS_PATH}/include"
REDIS_LDFLAGS="-L${REDIS_PATH}/lib"
REDIS_LIBS="-Wl,-rpath,${REDIS_PATH}/lib -L${REDIS_PATH}/lib -lhiredis"

UCPHP_PATH=/home/soh/git/uc-php
UCPHP_CFLAGS="-I${UCPHP_PATH}/includes"
UCPHP_LDFLAGS="-L${UCPHP_PATH}"
UCPHP_LIBS="-L${UCPHP_PATH} -luc_php -Wl,-rpath,/home/soh/git/uc-php"
UCPHP2_LIBS="-L${UCPHP_PATH} -luc_php2 -Wl,-rpath,/home/soh/git/uc-php"

CFLAGS="${HASKELL_CFLAGS} ${ZLOG_CFLAGS} ${XXHASH_CFLAGS} ${REDIS_CFLAGS} ${UCPHP_CFLAGS} -DDISABLE_STRING_INTERNING -ggdb3 --coverage"
LDFLAGS="${HASKELL_LDFLAGS} ${ZLOG_LDFLAGS} ${XXHASH_LDFLAGS} ${REDIS_LDFLAGS} ${UCPHP_LDFLAGS} --coverage"
LIBS="${HASKELL_LIBS} ${ZLOG_LIBS} ${XXHASH_LIBS} ${REDIS_LIBS} ${UCPHP_LIBS} ${UCPHP2_LIBS}"

./configure --prefix=${PREFIX_PATH} --enable-xdebug --with-php-config=/home/soh/concolic_php/bin/php-config CFLAGS="${CFLAGS}" LDFLAGS="${LDFLAGS}" LIBS="${LIBS}"
