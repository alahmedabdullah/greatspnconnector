#!/bin/sh
# version 2.0

yum -y update

WORK_DIR=`pwd`

GREATSPN_PACKAGE_NAME=$(sed 's/GREATSPN_PACKAGE_NAME=//' $WORK_DIR/package_metadata.txt)
cp $WORK_DIR/$GREATSPN_PACKAGE_NAME /opt

cd /opt/
tar -xvf $GREATSPN_PACKAGE_NAME
rm $GREATSPN_PACKAGE_NAME

cd $WORK_DIR
