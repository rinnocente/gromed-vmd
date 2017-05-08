# gromed-vmd
gromed + vmd

vmd = Visual Molecular Dynamics see [Uiuc VMD](http://www.ks.uiuc.edu/Research/vmd/)

The vmd license imposes some restrictions on the distribution of the application.

Private people can not distribute the code, organizations only to members. 

You need to register to download the code.

It is not legal to include vmd in a docker container.

Therefore we prepared a small docker hat for the gromed docker
that easily permits to include vmd, provided that users download by
themself the vmd code base.

```
mkdir ~/gromed-vmd
cd ~/gromed-vmd
wget https://raw.githubusercontent.com/rinnocente/gromed-vmd/master/Dockerfile
cp ~/Download/vmd-1.9.3.bin.LINUXAMD64-CUDA8-OptiX4-OSPRay111p1.opengl.tar.gz  .
docker build -t gromed-vmd .
CONT=`docker run -P -itd gromed-vmd`
PORT=`docker port $CONT|sed -e 's/.*://'`
ssh -X -p $PORT gromed@127.0.0.1
```
