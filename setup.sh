#!/bin/bash

# This script sets up the directory hierarchy for tutoiral

CWD="${PWD}"
EXERCISE1="${CWD}/Workbench/hello_world"
EXERCISE2="${CWD}/Workbench/exercise1"
EXERCISE3="${CWD}/Workbench/exercise2"
EXERCISE4="${CWD}/Workbench/exercise3"

if [ ! -d ${EXERCISE1} ]; then
	mkdir -p ${EXERCISE1}/c
	mkdir -p ${EXERCISE1}/ftn
fi

if [ ! -d ${EXERCISE2} ]; then
	mkdir -p ${EXERCISE2}/c
	mkdir -p ${EXERCISE2}/ftn
fi

if [ ! -d ${EXERCISE3} ]; then
	mkdir -p ${EXERCISE3}/c
	mkdir -p ${EXERCISE3}/ftn
fi

if [ ! -d ${EXERCISE4} ]; then
	mkdir -p ${EXERCISE4}/c
	mkdir -p ${EXERCISE4}/ftn
fi

#Copy sources
cp ${CWD}/Solutions/c/src/hello-omp.c ${EXERCISE1}/c/
cp ${CWD}/Solutions/ftn/src/hello-omp.f90 ${EXERCISE1}/ftn/

cp ${CWD}/Solutions/c/src/pi-serial.c ${EXERCISE2}/c/pi-serial.c
cp ${CWD}/Solutions/ftn/src/pi-serial.f90  ${EXERCISE2}/ftn/pi-serial.f90
cp ${CWD}/Solutions/c/src/pi-serial.c ${EXERCISE3}/c/pi-omp-v1.c
cp ${CWD}/Solutions/ftn/src/pi-serial.f90 ${EXERCISE3}/ftn/pi-omp-v1.f90
cp ${CWD}/Solutions/c/src/pi-serial.c ${EXERCISE4}/c/pi-omp-v2.c
cp ${CWD}/Solutions/ftn/src/pi-serial.f90 ${EXERCISE4}/ftn/pi-omp-v2.f90

cp ${CWD}/Solutions/c/makefiles/hello-make ${EXERCISE1}/c/Makefile
cp ${CWD}/Solutions/ftn/makefiles/hello-make ${EXERCISE1}/ftn/Makefile
cp ${CWD}/Solutions/c/makefiles/pi-serial-make ${EXERCISE2}/c/Makefile
cp ${CWD}/Solutions/ftn/makefiles/pi-serial-make ${EXERCISE2}/ftn/Makefile
cp ${CWD}/Solutions/c/makefiles/pi-omp-v1-make ${EXERCISE3}/c/Makefile
cp ${CWD}/Solutions/ftn/makefiles/pi-omp-v1-make ${EXERCISE3}/ftn/Makefile
cp ${CWD}/Solutions/c/makefiles/pi-omp-v2-make ${EXERCISE4}/c/Makefile
cp ${CWD}/Solutions/ftn/makefiles/pi-omp-v2-make ${EXERCISE4}/ftn/Makefile
