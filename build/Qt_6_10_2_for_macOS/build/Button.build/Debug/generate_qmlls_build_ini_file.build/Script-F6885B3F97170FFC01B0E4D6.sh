#!/bin/sh
set -e
if test "$CONFIGURATION" = "Debug"; then :
  cd /Users/giovannigil/Button/build/Qt_6_10_2_for_macOS
  /Users/giovannigil/Qt/Tools/CMake/CMake.app/Contents/bin/cmake -E echo [General] > /Users/giovannigil/Button/build/Qt_6_10_2_for_macOS/.qt/.qmlls.build.ini
  /Users/giovannigil/Qt/Tools/CMake/CMake.app/Contents/bin/cmake -E echo_append docDir= >> /Users/giovannigil/Button/build/Qt_6_10_2_for_macOS/.qt/.qmlls.build.ini
  /Users/giovannigil/Qt/6.10.2/macos/bin/qtpaths --query QT_INSTALL_DOCS >> /Users/giovannigil/Button/build/Qt_6_10_2_for_macOS/.qt/.qmlls.build.ini
  /Users/giovannigil/Qt/Tools/CMake/CMake.app/Contents/bin/cmake -E echo "[<SLASH>Users<SLASH>giovannigil<SLASH>Button]" >> /Users/giovannigil/Button/build/Qt_6_10_2_for_macOS/.qt/.qmlls.build.ini
  /Users/giovannigil/Qt/Tools/CMake/CMake.app/Contents/bin/cmake -E echo importPaths=\"/Users/giovannigil/Button/build/Qt_6_10_2_for_macOS:/Users/giovannigil/Button/build/Qt_6_10_2_for_macOS/Button:/Users/giovannigil/Qt/6.10.2/macos/qml\" >> /Users/giovannigil/Button/build/Qt_6_10_2_for_macOS/.qt/.qmlls.build.ini
fi
if test "$CONFIGURATION" = "Release"; then :
  cd /Users/giovannigil/Button/build/Qt_6_10_2_for_macOS
  /Users/giovannigil/Qt/Tools/CMake/CMake.app/Contents/bin/cmake -E echo [General] > /Users/giovannigil/Button/build/Qt_6_10_2_for_macOS/.qt/.qmlls.build.ini
  /Users/giovannigil/Qt/Tools/CMake/CMake.app/Contents/bin/cmake -E echo_append docDir= >> /Users/giovannigil/Button/build/Qt_6_10_2_for_macOS/.qt/.qmlls.build.ini
  /Users/giovannigil/Qt/6.10.2/macos/bin/qtpaths --query QT_INSTALL_DOCS >> /Users/giovannigil/Button/build/Qt_6_10_2_for_macOS/.qt/.qmlls.build.ini
  /Users/giovannigil/Qt/Tools/CMake/CMake.app/Contents/bin/cmake -E echo "[<SLASH>Users<SLASH>giovannigil<SLASH>Button]" >> /Users/giovannigil/Button/build/Qt_6_10_2_for_macOS/.qt/.qmlls.build.ini
  /Users/giovannigil/Qt/Tools/CMake/CMake.app/Contents/bin/cmake -E echo importPaths=\"/Users/giovannigil/Button/build/Qt_6_10_2_for_macOS:/Users/giovannigil/Button/build/Qt_6_10_2_for_macOS/Button:/Users/giovannigil/Qt/6.10.2/macos/qml\" >> /Users/giovannigil/Button/build/Qt_6_10_2_for_macOS/.qt/.qmlls.build.ini
fi
if test "$CONFIGURATION" = "MinSizeRel"; then :
  cd /Users/giovannigil/Button/build/Qt_6_10_2_for_macOS
  /Users/giovannigil/Qt/Tools/CMake/CMake.app/Contents/bin/cmake -E echo [General] > /Users/giovannigil/Button/build/Qt_6_10_2_for_macOS/.qt/.qmlls.build.ini
  /Users/giovannigil/Qt/Tools/CMake/CMake.app/Contents/bin/cmake -E echo_append docDir= >> /Users/giovannigil/Button/build/Qt_6_10_2_for_macOS/.qt/.qmlls.build.ini
  /Users/giovannigil/Qt/6.10.2/macos/bin/qtpaths --query QT_INSTALL_DOCS >> /Users/giovannigil/Button/build/Qt_6_10_2_for_macOS/.qt/.qmlls.build.ini
  /Users/giovannigil/Qt/Tools/CMake/CMake.app/Contents/bin/cmake -E echo "[<SLASH>Users<SLASH>giovannigil<SLASH>Button]" >> /Users/giovannigil/Button/build/Qt_6_10_2_for_macOS/.qt/.qmlls.build.ini
  /Users/giovannigil/Qt/Tools/CMake/CMake.app/Contents/bin/cmake -E echo importPaths=\"/Users/giovannigil/Button/build/Qt_6_10_2_for_macOS:/Users/giovannigil/Button/build/Qt_6_10_2_for_macOS/Button:/Users/giovannigil/Qt/6.10.2/macos/qml\" >> /Users/giovannigil/Button/build/Qt_6_10_2_for_macOS/.qt/.qmlls.build.ini
fi
if test "$CONFIGURATION" = "RelWithDebInfo"; then :
  cd /Users/giovannigil/Button/build/Qt_6_10_2_for_macOS
  /Users/giovannigil/Qt/Tools/CMake/CMake.app/Contents/bin/cmake -E echo [General] > /Users/giovannigil/Button/build/Qt_6_10_2_for_macOS/.qt/.qmlls.build.ini
  /Users/giovannigil/Qt/Tools/CMake/CMake.app/Contents/bin/cmake -E echo_append docDir= >> /Users/giovannigil/Button/build/Qt_6_10_2_for_macOS/.qt/.qmlls.build.ini
  /Users/giovannigil/Qt/6.10.2/macos/bin/qtpaths --query QT_INSTALL_DOCS >> /Users/giovannigil/Button/build/Qt_6_10_2_for_macOS/.qt/.qmlls.build.ini
  /Users/giovannigil/Qt/Tools/CMake/CMake.app/Contents/bin/cmake -E echo "[<SLASH>Users<SLASH>giovannigil<SLASH>Button]" >> /Users/giovannigil/Button/build/Qt_6_10_2_for_macOS/.qt/.qmlls.build.ini
  /Users/giovannigil/Qt/Tools/CMake/CMake.app/Contents/bin/cmake -E echo importPaths=\"/Users/giovannigil/Button/build/Qt_6_10_2_for_macOS:/Users/giovannigil/Button/build/Qt_6_10_2_for_macOS/Button:/Users/giovannigil/Qt/6.10.2/macos/qml\" >> /Users/giovannigil/Button/build/Qt_6_10_2_for_macOS/.qt/.qmlls.build.ini
fi

