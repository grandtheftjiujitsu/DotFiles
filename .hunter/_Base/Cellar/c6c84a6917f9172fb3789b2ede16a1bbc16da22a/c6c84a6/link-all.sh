export "HUNTER_CELLAR_RAW_DIRECTORY=/home/austin/.hunter/_Base/Cellar/c6c84a6917f9172fb3789b2ede16a1bbc16da22a/c6c84a6/raw"

ln \
  "${HUNTER_CELLAR_RAW_DIRECTORY}/include/zconf.h" \
  "$1/include/zconf.h"

ln \
  "${HUNTER_CELLAR_RAW_DIRECTORY}/include/zlib.h" \
  "$1/include/zlib.h"

ln \
  "${HUNTER_CELLAR_RAW_DIRECTORY}/lib/cmake/ZLIB/ZLIBConfig.cmake" \
  "$1/lib/cmake/ZLIB/ZLIBConfig.cmake"

ln \
  "${HUNTER_CELLAR_RAW_DIRECTORY}/lib/cmake/ZLIB/ZLIBConfigVersion.cmake" \
  "$1/lib/cmake/ZLIB/ZLIBConfigVersion.cmake"

ln \
  "${HUNTER_CELLAR_RAW_DIRECTORY}/lib/cmake/ZLIB/ZLIBTargets-release.cmake" \
  "$1/lib/cmake/ZLIB/ZLIBTargets-release.cmake"

ln \
  "${HUNTER_CELLAR_RAW_DIRECTORY}/lib/cmake/ZLIB/ZLIBTargets.cmake" \
  "$1/lib/cmake/ZLIB/ZLIBTargets.cmake"

ln \
  "${HUNTER_CELLAR_RAW_DIRECTORY}/lib/libz.a" \
  "$1/lib/libz.a"

ln \
  "${HUNTER_CELLAR_RAW_DIRECTORY}/share/man/man3/zlib.3" \
  "$1/share/man/man3/zlib.3"

ln \
  "${HUNTER_CELLAR_RAW_DIRECTORY}/share/pkgconfig/zlib.pc" \
  "$1/share/pkgconfig/zlib.pc"

