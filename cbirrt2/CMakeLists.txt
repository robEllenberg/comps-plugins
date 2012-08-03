#Rearranged to install to openrave plugins dir and removed ROS section for simplicity
if( CMAKE_COMPILER_IS_GNUCC OR CMAKE_COMPILER_IS_GNUCXX )
    add_definitions("-fno-strict-aliasing ")
endif()

cmake_minimum_required (VERSION 2.4)
if(POLICY CMP0015)
    cmake_policy(SET CMP0015 NEW)
endif()
project (cbirrt)

#-- Get the openrave share directory
EXEC_PROGRAM("openrave-config --share-dir" OUTPUT_VARIABLE OpenRAVE_SHARE_DIR)
message(STATUS "Openrave Share directory: ${OpenRAVE_SHARE_DIR}")

include(FindOpenRAVE.cmake)

if( NOT OPENRAVE_FOUND )
    message(FATAL_ERROR "could not find openrave, check for openrave-config in path")
endif( NOT OPENRAVE_FOUND )

link_directories(${OPENRAVE_LINK_DIRS})
add_library(cbirrt SHARED cbirrtmain.cpp TaskSpaceRegion.cpp cbirrt.cpp cbirrtproblem.cpp)
set_target_properties(cbirrt PROPERTIES
    LINK_FLAGS ${OPENRAVE_LINK_FLAGS}
    COMPILE_FLAGS ${OPENRAVE_CXXFLAGS})
include_directories(${OPENRAVE_INCLUDE_DIRS} ${THIRDPARTY_DIR}/inc/newmat)
target_link_libraries(cbirrt ${OPENRAVE_LIBRARY} qhull newmat)

install(TARGETS cbirrt DESTINATION ${OpenRAVE_SHARE_DIR}/plugins )

