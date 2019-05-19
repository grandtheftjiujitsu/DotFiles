#!/bin/sh

unzip -o stockfish-20141126.zip
cd Stockfish-master/src

if [ $OS_ARCH = "x86_64" ]
then
	ARCH=x86-64-modern
elif [ $OS_ARCH = "ppc64" ]
then
	ARCH=ppc-64
elif [ $OS_ARCH = "i686" ]
then
	ARCH=x86-32
elif [ $OS_ARCH = "armv7" ]
then
	ARCH=armv7
else
	ARCH=general-64
fi

make build ARCH=$ARCH
echo $? > ~/install-exit-status
cd ~

echo "#!/bin/sh
cd Stockfish-master/src
./stockfish bench > \$LOG_FILE 2>&1
echo \$? > ~/test-exit-status" > stockfish
chmod +x stockfish
