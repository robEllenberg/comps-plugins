#!/bin/sh

for pkg in generalik cbirrt2 manipulation2
do
   cd $pkg
   [ -d build ] || mkdir build
   cd build
   cmake ../
   make
   cd ../../
done

