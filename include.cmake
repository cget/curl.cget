CGET_HAS_DEPENDENCY(OpenSSL REGISTRY VERSION master NO_FIND_PACKAGE)
CGET_HAS_DEPENDENCY(Libssh2 REGISTRY VERSION master)

SET(CURL_BUILD_OPTIONS "-DBUILD_CURL_TESTS=OFF -DBUILD_CURL_EXE=OFF" )

if(${CMAKE_CROSSCOMPILING})
  # Disable all the try_runs for cross compilation
  SET(CURL_BUILD_OPTIONS "${CURL_BUILD_OPTIONS} -DHAVE_POLL_FINE:BOOL=OFF -DHAVE_STRERROR_R:BOOL=OFF -DHAVE_GLIBC_STRERROR_R_COMPILE:BOOL=OFF -DHAVE_POSIX_STRERROR_R_COMPILE:BOOL=OFF" )
endif()

if(MSVC)
  SET(CURL_BUILD_OPTIONS "${CURL_BUILD_OPTIONS} -DHAVE_SCHANNEL_H:BOOL=OFF")
endif()

CGET_HAS_DEPENDENCY(CURL GITHUB bagder/curl VERSION curl-7_45_0 NO_FIND_PACKAGE
  OPTIONS "-DBUILD_CURL_TESTS=OFF -DBUILD_CURL_EXE=OFF ${CURL_BUILD_OPTIONS}" )  
