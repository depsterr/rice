#!/bin/sh
cd "$(dirname $0)"
SRCDIR=$PWD

echo "===> Installing dwm"
cd ./wm/dwm || {
	echo "no wm folder?"
	exit
}

sudo make install
cd "$SRCDIR"

echo "===> Installing st"
cd ./terminal/st || {
	echo "no terminal folder?"
	exit
}

sudo make install
cd "$SRCDIR"

echo "===> Installing configuration files"
cp configs/. ~ -Raf
