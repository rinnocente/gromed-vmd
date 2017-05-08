#
FROM rinnocente/gromed-general
#
# Docker pull the rinnocente/gromed-general image
#
# Make a subdirectory named gromed-vmd
#
# Register at http://www.ks.uiuc.edu/Development/Download/download.cgi
#    download from there the LINUX_64 OpenGL, CUDA, OptiX, OSPRay code 
#    http://www.ks.uiuc.edu/Development/Download/download.cgi?UserID=&AccessCode=&ArchiveID=1475
#    and put the tarball in the gromed-vmd directory
# 
# Put this Dockerfile in the gromed-vmd directory : 
#    wget https://raw.githubusercontent.com/rinnocente/gromed-vmd/master/Dockerfile
# 
# Run docker build inside the gromed-vmd directory :
#   docker build -t gromed-vmd .
#
# Now running the image gromed-vmd 
# and ssh -X -p .. gromed@127.0.0.1
# will give you a container with vmd
#
COPY  vmd-1.9.3.bin.LINUXAMD64-CUDA8-OptiX4-OSPRay111p1.opengl.tar.gz /home/gromed/
RUN   tar xzf vmd-1.9.3.bin.LINUXAMD64-CUDA8-OptiX4-OSPRay111p1.opengl.tar.gz \
      && cd vmd-1.9.3 \
      && ./configure \
      && cd src; make install

#
# change owner to gromed:gromed
#
RUN	chown -R gromed:gromed /home/gromed

WORKDIR /home/gromed

EXPOSE 22

#
# the container can be now reached via ssh
CMD [ "/usr/sbin/sshd","-D" ]

