# Sets:
#   CBLAS_INCLUDE_DIR  = where cblas.h can be found
#   CBLAS_LIBRARY      = the library to link against (cblas etc)
#   CF_HAVE_CBLAS      = set to true after finding the library
#

OPTION ( CF_SKIP_CBLAS "Skip search for CBlas library" OFF )

IF ( NOT CF_SKIP_CBLAS )

SET_TRIAL_INCLUDE_PATH ("") # clear include search path
SET_TRIAL_LIBRARY_PATH ("") # clear library search path

ADD_TRIAL_INCLUDE_PATH( ${CBLAS_HOME}/include )
ADD_TRIAL_INCLUDE_PATH( $ENV{CBLAS_HOME}/include )

FIND_PATH(CBLAS_INCLUDE_DIR cblas.h ${TRIAL_INCLUDE_PATHS}  NO_DEFAULT_PATH)
FIND_PATH(CBLAS_INCLUDE_DIR cblas.h)

ADD_TRIAL_LIBRARY_PATH(${CBLAS_HOME}/lib )
ADD_TRIAL_LIBRARY_PATH($ENV{CBLAS_HOME}/lib )

FIND_LIBRARY(CBLAS_LIBRARY cblas ${TRIAL_LIBRARY_PATHS} NO_DEFAULT_PATH)
FIND_LIBRARY(CBLAS_LIBRARY cblas )

IF(CBLAS_INCLUDE_DIR AND CBLAS_LIBRARY)
  SET(CF_HAVE_CBLAS 1 CACHE BOOL "Found cblas library")
ELSE(CBLAS_INCLUDE_DIR AND CBLAS_LIBRARY)
  SET(CF_HAVE_CBLAS 0 CACHE BOOL "Not fount cblas library")
ENDIF(CBLAS_INCLUDE_DIR AND CBLAS_LIBRARY)

MARK_AS_ADVANCED (
  CBLAS_INCLUDE_DIR
  CBLAS_LIBRARY
  CF_HAVE_CBLAS
)

LOG ( "CF_HAVE_CBLAS: [${CF_HAVE_CBLAS}]" )
IF(CF_HAVE_CBLAS)
  LOGFILE ( "  CBLAS_INCLUDE_DIR: [${CBLAS_INCLUDE_DIR}]" )
  LOGFILE ( "  CBLAS_LIBRARY:     [${CBLAS_LIBRARY}]" )
ENDIF(CF_HAVE_CBLAS)

ENDIF ( NOT CF_SKIP_CBLAS )