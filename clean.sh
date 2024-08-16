#!/bin/bash

if [ -e ./buildroot ]; then
    cd ./buildroot
    make distclean 
fi