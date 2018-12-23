#!/bin/bash

curl -L https://github.com/dita-ot/dita-ot/releases/download/$DITA_OT_VERSION/dita-ot-$DITA_OT_VERSION.zip -o dita-ot-$DITA_OT_VERSION.zip
unzip dita-ot-$DITA_OT_VERSION.zip
export DITA_HOME=$PWD/dita-ot-$DITA_OT_VERSION

# Create and install plugin for 2.0 with latest doctypes
mkdir $DITA_HOME/plugins/org.oasis-open.dita.v2_0/
cp -a ./doctypes/. $DITA_HOME/plugins/org.oasis-open.dita.v2_0/
cp .travis/ditaotplugin.xml $DITA_HOME/plugins/org.oasis-open.dita.v2_0/plugin.xml
$DITA_HOME/bin/dita -install

# Install RNG support
curl -L https://github.com/oxygenxml/dita-relaxng-defaults/archive/master.zip -o dita-ng.zip
$DITA_HOME/bin/dita -install dita-ng.zip -v

# Grab test files
curl -L https://github.com/robander/metadita-sampledocs/archive/master.zip -o testfiles.zip
unzip testfiles.zip

