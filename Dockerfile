#
FROM rinnocente/gromed-general
#
# Docker pulled the rinnocente/gromacs-general image
#
# Make a subdirectory named gromed-vmd
#
# Register at http://www.ks.uiuc.edu/Development/Download/download.cgi
#    download from there the LINUX_64 OpenGL, CUDA, OptiX, OSPRay code 
#    http://www.ks.uiuc.edu/Development/Download/download.cgi?UserID=&AccessCode=&ArchiveID=1475
#    put vmd-1.9.3.bin.LINUXAMD64-CUDA8-OptiX4-OSPRay111p1.opengl.tar.gz in the gromed-vmd directory
# 
# Put this Dockerfile in the gromed-vmd directory : wget 
#
COPY
