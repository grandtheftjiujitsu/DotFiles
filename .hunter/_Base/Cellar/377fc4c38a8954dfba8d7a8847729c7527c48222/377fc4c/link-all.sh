export "HUNTER_CELLAR_RAW_DIRECTORY=/home/austin/.hunter/_Base/Cellar/377fc4c38a8954dfba8d7a8847729c7527c48222/377fc4c/raw"

ln \
  "${HUNTER_CELLAR_RAW_DIRECTORY}/lib/cmake/Boost/BoostConfig.cmake" \
  "$1/lib/cmake/Boost/BoostConfig.cmake"

ln \
  "${HUNTER_CELLAR_RAW_DIRECTORY}/lib/cmake/Boost/BoostConfigVersion.cmake" \
  "$1/lib/cmake/Boost/BoostConfigVersion.cmake"

ln \
  "${HUNTER_CELLAR_RAW_DIRECTORY}/lib/libboost_system-mt-d.a" \
  "$1/lib/libboost_system-mt-d.a"

ln \
  "${HUNTER_CELLAR_RAW_DIRECTORY}/lib/libboost_system-mt.a" \
  "$1/lib/libboost_system-mt.a"

