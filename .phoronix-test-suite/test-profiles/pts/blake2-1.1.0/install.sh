#!/bin/sh

unzip -o blake2_code_20130131.zip
cd blake2_code_20130131/bench
make
cd ~/

echo "#!/bin/sh
cd blake2_code_20130131/bench
./blake2s > \$LOG_FILE 2>&1
echo \$? > ~/test-exit-status" > blake2
chmod +x blake2
