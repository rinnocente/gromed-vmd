#!/bin/bash
#
# do everything for building a gromed + vmd
# we assume the user downloaded from http://www.ks.uiuc.edu/Development/Download/download.cgi
# the vmd-1.9.3.bin.LINUXAMD64-CUDA8-OptiX4-OSPRay111p1.opengl.tar.gz tarball in
# the standard ~/Downloads/ directory.
docker build -t gromed-vmd .
CONT=`docker run -P -itd gromed-vmd`
PORT=`docker port $CONT|sed -e 's/.*://'`
# initial passwd is mammamia
ssh -X -p $PORT gromed@127.0.0.1
