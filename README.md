# gromed-vmd (GRO[macs] + [plu]MED + VMD) 
(GRO[macs] + [plu]MED + VMD) in a single container


vmd = Visual Molecular Dynamics see [Uiuc VMD](http://www.ks.uiuc.edu/Research/vmd/)

**The best way to run all you need GROMACS + PLUMED + VMD in some clicks.**

The vmd license imposes some restrictions on the distribution of the application.

If the App is downloaded as a private you can not  distribute it , if the app is
downloaded as a organization can be distributed only to members. 
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

## Efficient use of X11 from a "LOCAL" docker container

The standard method to log into the container with `ssh -X ` works but is not
efficient. Another way it is possible on a Unix host with some complications.
Instead of using ssh to multiplex X11 on the same channel we map
directly the X11 socket of the host on the container 
(the ubuntu image needs the `libxext-dev` library) :
```
docker run -ti  -e DISPLAY=$DISPLAY -v /etc/localtime:/etc/localtime:ro -v /tmp/.X11-unix:/tmp/.X11-unix:ro --device /dev/dri   gromed-vmd /bin/bash
```
