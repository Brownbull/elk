#!/bin/bash
cp $1 /bin
chmod a+x /bin/$1
echo "source .profile"
echo "which $1"
