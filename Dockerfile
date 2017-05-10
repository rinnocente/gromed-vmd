#
FROM rinnocente/gromed
#
# Docker pull the rinnocente/gromed image
#
#
# Register at http://www.ks.uiuc.edu/Development/Download/download.cgi
#    download from there the LINUX_64 OpenGL, CUDA, OptiX, OSPRay code 
#    http://www.ks.uiuc.edu/Development/Download/download.cgi?UserID=&AccessCode=&ArchiveID=1475
#    in the standard ~/Downloads/ directory.
# 
# Then :
#    git clone  https://github.com/rinnocente/gromed-vmd.git
#    cd gromed-vmd
#    bash do-it-all.sh
# 
#
# Now running the image gromed-vmd 
# and ssh -X -p .. gromed@127.0.0.1
# will give you a container with vmd
#
COPY  vmd-1.9.3.bin.LINUXAMD64-CUDA8-OptiX4-OSPRay111p1.opengl.tar.gz /home/gromed/
RUN   tar xzf vmd-1.9.3.bin.LINUXAMD64-CUDA8-OptiX4-OSPRay111p1.opengl.tar.gz \
      && cd vmd-1.9.3 \
      && ./configure \
      && cd src; make install \
      && cd ../.. ; mv vmd-1.9.3.bin.LINUXAMD64-CUDA8-OptiX4-OSPRay111p1.opengl.tar.gz downloads/
#
# change owner to gromed:gromed
#
RUN	chown -R gromed:gromed /home/gromed
#
WORKDIR /home/gromed
#
EXPOSE 22
#
# the container can be now reached via ssh
CMD [ "/usr/sbin/sshd","-D" ]

