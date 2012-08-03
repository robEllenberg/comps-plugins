cmake_minimum_required (VERSION 2.4)
project (manipulation)

include(FindOpenRAVE.cmake)

if( NOT OPENRAVE_FOUND )
    message(FATAL_ERROR "could not find openrave, check for openrave-config in path")
endif( NOT OPENRAVE_FOUND )

if( CMAKE_COMPILER_IS_GNUCC OR CMAKE_COMPILER_IS_GNUCXX )
    add_definitions("-fno-strict-aliasing ")
endif()

#-- Get the openrave share directory
EXEC_PROGRAM("openrave-config --share-dir" OUTPUT_VARIABLE OpenRAVE_SHARE_DIR)
message(STATUS "Openrave Share directory: ${OpenRAVE_SHARE_DIR}")

find_package(Boost COMPONENTS regex)

add_library(manipulation SHARED manipulationmain.cpp manipulation.cpp trajectoryproblem.cpp)
set_target_properties(manipulation PROPERTIES
    LINK_FLAGS ${OPENRAVE_LINK_FLAGS}
    COMPILE_FLAGS ${OPENRAVE_CXXFLAGS})
include_directories(${OPENRAVE_INCLUDE_DIRS} ${Boost_INCLUDE_DIRS})
link_directories(${OPENRAVE_LINK_DIRS} ${Boost_LIBRARY_DIRS})
target_link_libraries(manipulation ${OPENRAVE_LIBRARY} ${Boost_LIBRARIES})

install(TARGETS manipulation DESTINATION ${OpenRAVE_SHARE_DIR}/plugins  )

