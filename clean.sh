#!/bin/sh

for pkg in generalik cbirrt2 manipulation2
do
   cd $pkg
   rm -rf build
   cd ..
done

