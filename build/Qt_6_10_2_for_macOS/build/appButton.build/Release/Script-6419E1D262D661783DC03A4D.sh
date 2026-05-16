#!/bin/sh
set -e
if test "$CONFIGURATION" = "Debug"; then :
  cd /Users/giovannigil/Button/build/Qt_6_10_2_for_macOS
  /Users/giovannigil/Qt/6.10.2/macos/libexec/qmlcachegen --resource-name qmlcache_appButton -o /Users/giovannigil/Button/build/Qt_6_10_2_for_macOS/.rcc/qmlcache/appButton_qmlcache_loader.cpp @/Users/giovannigil/Button/build/Qt_6_10_2_for_macOS/.rcc/qmlcache/appButton_qml_loader_file_list.rsp
fi
if test "$CONFIGURATION" = "Release"; then :
  cd /Users/giovannigil/Button/build/Qt_6_10_2_for_macOS
  /Users/giovannigil/Qt/6.10.2/macos/libexec/qmlcachegen --resource-name qmlcache_appButton -o /Users/giovannigil/Button/build/Qt_6_10_2_for_macOS/.rcc/qmlcache/appButton_qmlcache_loader.cpp @/Users/giovannigil/Button/build/Qt_6_10_2_for_macOS/.rcc/qmlcache/appButton_qml_loader_file_list.rsp
fi
if test "$CONFIGURATION" = "MinSizeRel"; then :
  cd /Users/giovannigil/Button/build/Qt_6_10_2_for_macOS
  /Users/giovannigil/Qt/6.10.2/macos/libexec/qmlcachegen --resource-name qmlcache_appButton -o /Users/giovannigil/Button/build/Qt_6_10_2_for_macOS/.rcc/qmlcache/appButton_qmlcache_loader.cpp @/Users/giovannigil/Button/build/Qt_6_10_2_for_macOS/.rcc/qmlcache/appButton_qml_loader_file_list.rsp
fi
if test "$CONFIGURATION" = "RelWithDebInfo"; then :
  cd /Users/giovannigil/Button/build/Qt_6_10_2_for_macOS
  /Users/giovannigil/Qt/6.10.2/macos/libexec/qmlcachegen --resource-name qmlcache_appButton -o /Users/giovannigil/Button/build/Qt_6_10_2_for_macOS/.rcc/qmlcache/appButton_qmlcache_loader.cpp @/Users/giovannigil/Button/build/Qt_6_10_2_for_macOS/.rcc/qmlcache/appButton_qml_loader_file_list.rsp
fi

