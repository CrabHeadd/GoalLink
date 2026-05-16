#!/bin/sh
set -e
if test "$CONFIGURATION" = "Debug"; then :
  cd /Users/giovannigil/Button/build/Qt_6_10_2_for_macOS
  /Users/giovannigil/Qt/6.10.2/macos/libexec/rcc --output /Users/giovannigil/Button/build/Qt_6_10_2_for_macOS/.qt/rcc/qrc_appButton_raw_qml_0.cpp --name appButton_raw_qml_0 /Users/giovannigil/Button/build/Qt_6_10_2_for_macOS/.qt/rcc/appButton_raw_qml_0.qrc --no-zstd
fi
if test "$CONFIGURATION" = "Release"; then :
  cd /Users/giovannigil/Button/build/Qt_6_10_2_for_macOS
  /Users/giovannigil/Qt/6.10.2/macos/libexec/rcc --output /Users/giovannigil/Button/build/Qt_6_10_2_for_macOS/.qt/rcc/qrc_appButton_raw_qml_0.cpp --name appButton_raw_qml_0 /Users/giovannigil/Button/build/Qt_6_10_2_for_macOS/.qt/rcc/appButton_raw_qml_0.qrc --no-zstd
fi
if test "$CONFIGURATION" = "MinSizeRel"; then :
  cd /Users/giovannigil/Button/build/Qt_6_10_2_for_macOS
  /Users/giovannigil/Qt/6.10.2/macos/libexec/rcc --output /Users/giovannigil/Button/build/Qt_6_10_2_for_macOS/.qt/rcc/qrc_appButton_raw_qml_0.cpp --name appButton_raw_qml_0 /Users/giovannigil/Button/build/Qt_6_10_2_for_macOS/.qt/rcc/appButton_raw_qml_0.qrc --no-zstd
fi
if test "$CONFIGURATION" = "RelWithDebInfo"; then :
  cd /Users/giovannigil/Button/build/Qt_6_10_2_for_macOS
  /Users/giovannigil/Qt/6.10.2/macos/libexec/rcc --output /Users/giovannigil/Button/build/Qt_6_10_2_for_macOS/.qt/rcc/qrc_appButton_raw_qml_0.cpp --name appButton_raw_qml_0 /Users/giovannigil/Button/build/Qt_6_10_2_for_macOS/.qt/rcc/appButton_raw_qml_0.qrc --no-zstd
fi

