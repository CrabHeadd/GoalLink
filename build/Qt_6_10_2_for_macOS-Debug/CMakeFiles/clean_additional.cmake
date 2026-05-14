# Additional clean files
cmake_minimum_required(VERSION 3.16)

if("${CONFIG}" STREQUAL "" OR "${CONFIG}" STREQUAL "Debug")
  file(REMOVE_RECURSE
  "CMakeFiles/appButton_autogen.dir/AutogenUsed.txt"
  "CMakeFiles/appButton_autogen.dir/ParseCache.txt"
  "appButton_autogen"
  )
endif()
