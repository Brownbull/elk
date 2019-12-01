#!/bin/bash
sudo cp $1 /bin
sudo chmod a+x /bin/$1
cd ~
source .profile
which $1
