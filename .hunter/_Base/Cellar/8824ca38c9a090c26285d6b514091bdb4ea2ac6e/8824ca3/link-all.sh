export "HUNTER_CELLAR_RAW_DIRECTORY=/home/austin/.hunter/_Base/Cellar/8824ca38c9a090c26285d6b514091bdb4ea2ac6e/8824ca3/raw"

ln \
  "${HUNTER_CELLAR_RAW_DIRECTORY}/include/intsizeof.h" \
  "$1/include/intsizeof.h"

ln \
  "${HUNTER_CELLAR_RAW_DIRECTORY}/lib/cmake/intsizeof/intsizeofConfig.cmake" \
  "$1/lib/cmake/intsizeof/intsizeofConfig.cmake"

ln \
  "${HUNTER_CELLAR_RAW_DIRECTORY}/lib/cmake/intsizeof/intsizeofTargets.cmake" \
  "$1/lib/cmake/intsizeof/intsizeofTargets.cmake"

ln \
  "${HUNTER_CELLAR_RAW_DIRECTORY}/licenses/intsizeof/LICENSE" \
  "$1/licenses/intsizeof/LICENSE"

