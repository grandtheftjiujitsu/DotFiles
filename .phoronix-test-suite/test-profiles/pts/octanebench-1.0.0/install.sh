#!/bin/sh

unzip -o OctaneBench_2_17_linux.zip

echo "#!/bin/bash
cd OctaneBench_2_17_linux/
export HOME=\${DEBUG_REAL_HOME%/}
./octane_demo  --benchmark --no-gui -g 0 -a \$LOG_FILE
echo \$? > ~/test-exit-status" > octanebench
chmod +x octanebench
