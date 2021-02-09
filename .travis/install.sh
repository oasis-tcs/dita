#!/bin/bash

set -e

# Install DITA-OT
curl -sfL https://github.com/dita-ot/dita-ot/releases/download/$DITA_OT_VERSION/dita-ot-$DITA_OT_VERSION.zip -o dita-ot-$DITA_OT_VERSION.zip
unzip -q dita-ot-$DITA_OT_VERSION.zip
export DITA_HOME=$PWD/dita-ot-$DITA_OT_VERSION

# Copy latest base doctype updates over the beta version in DITA-OT;
# replace whatever (possibly older) version is currently shipped.
rm -rv $DITA_HOME/plugins/org.oasis-open.dita.v2_0/dtd/
rm -rv $DITA_HOME/plugins/org.oasis-open.dita.v2_0/rng/
cp -av ./doctypes/. $DITA_HOME/plugins/org.oasis-open.dita.v2_0/
$DITA_HOME/bin/dita install

# Install RNG support
#curl -sfL https://github.com/oxygenxml/dita-relaxng-defaults/archive/master.zip -o dita-ng.zip
#$DITA_HOME/bin/dita -install dita-ng.zip -v
#rm dita-ng.zip

# Grab test files
curl -sfL https://github.com/robander/metadita-sampledocs/archive/master.zip -o testfiles.zip
unzip testfiles.zip
rm testfiles.zip
