#!/bin/sh

for pkg in generalik cbirrt2 manipulation2
do
   cd $pkg
   rm -rf build
   mkdir build
   cd build
   cmake ../
   make
   cd ../../
done

