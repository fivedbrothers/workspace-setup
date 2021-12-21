#!/bin/bash

export SCRIPTDIR=$(dirname $(realpath $BASH_SOURCE))

# Environment Variables
# common environment variables
export WORKSPACE=$(cygpath -u "$USERPROFILE/.workspace")
export TMP=$WORKSPACE/.tmp 

export DEVTOOLS=$WORKSPACE/devtools
export PROJECTS=$WORKSPACE/projects

export SYSTEMC=$DEVTOOLS/systemc

if [ ! -d "$WORKSPACE" ]; then
    mkdir -p $TMP
    mkdir -p $DEVTOOLS
    mkdir -p $PROJECTS
fi

export CXX=g++
export STDCXX=17
export STDCXX="-std=gnu++$STDCXX"

export CCI_VERSION=1.0.0
export CCI_HOME=$SYSTEMC/cci-$CCI_VERSION
export CCI_TOOLKIT=https://www.accellera.org/images/downloads/standards/systemc/cci-$CCI_VERSION.zip

cd $TMP

echo ""
echo "Setup :: Source Folders"
echo "************************************************************"
export CCI_SOURCE=$CCI_HOME/src

echo ""
echo "Downloading :: SystemC CCI $CCI_VERSION Toolkit :: $CCI_TOOLKIT"
echo "************************************************************"
wget $CCI_TOOLKIT

echo ""
echo "Creating :: SystemC CCI Install Folder :: $CCI_HOME"
echo "************************************************************"
unzip -d $SYSTEMC cci-$CCI_VERSION.zip

echo ""
echo "Build and Install SystemC CCI Library"
echo ""
echo "Entering :: SystemC CCI Source Folder :: $CCI_SOURCE"
echo "************************************************************"
cd $CCI_SOURCE

echo ""
echo "Building :: SystemC CCI $CCI_VERSION Toolkit"
echo "************************************************************"
make -j 8 V=1 OPT=-O2 CXX=g++ CXXFLAGS=$STDCXX RAPIDJSON_HOME=/mingw64/include/rapidjson

echo ""
echo "Cleaning :: SystemC CCI $CCI_VERSION Toolki"
echo "************************************************************"
# rm -rf $TMP/cci-$CCI_VERSION.zip

# logout
logout
