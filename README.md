# gromed-vmd
gromed + vmd

vmd = Visual Molecular Dynamics see [Uiuc VMD](http://www.ks.uiuc.edu/Research/vmd/)

**The best way to run all you need GROMACS + PLUMED + VMD in some clicks.**

The vmd license imposes some restrictions on the distribution of the application.

Private people can not distribute the code, organizations only to members. 

You need to register to download the code.

It is not legal to include vmd in a docker container.

Therefore we prepared a small docker hat for the gromed docker
that easily permits to include vmd, provided that users download by
themself the vmd code base.

You need docker installed of course.
Go with the browser to http://www.ks.uiuc.edu/Development/Download/download.cgi , register yourself
and download the binary tarball ```vmd-1.9.3.bin.LINUXAMD64-CUDA8-OptiX4-OSPRay111p1.opengl.tar.gz```
in the standard ```~/Downloads/``` directory.

```
git clone https://github.com/rinnocente/gromed-vmd.git
cd gromed-vmd
cp ~/Downloads/vmd-1.9.3.bin.LINUXAMD64-CUDA8-OptiX4-OSPRay111p1.opengl.tar.gz .
bash do-it-all.sh
```
