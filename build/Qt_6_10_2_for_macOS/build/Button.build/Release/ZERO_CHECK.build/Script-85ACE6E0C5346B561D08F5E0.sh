#!/bin/sh
set -e
if test "$CONFIGURATION" = "Debug"; then :
  cd /Users/giovannigil/Button/build/Qt_6_10_2_for_macOS
  make -f /Users/giovannigil/Button/build/Qt_6_10_2_for_macOS/CMakeScripts/ReRunCMake.make
fi
if test "$CONFIGURATION" = "Release"; then :
  cd /Users/giovannigil/Button/build/Qt_6_10_2_for_macOS
  make -f /Users/giovannigil/Button/build/Qt_6_10_2_for_macOS/CMakeScripts/ReRunCMake.make
fi
if test "$CONFIGURATION" = "MinSizeRel"; then :
  cd /Users/giovannigil/Button/build/Qt_6_10_2_for_macOS
  make -f /Users/giovannigil/Button/build/Qt_6_10_2_for_macOS/CMakeScripts/ReRunCMake.make
fi
if test "$CONFIGURATION" = "RelWithDebInfo"; then :
  cd /Users/giovannigil/Button/build/Qt_6_10_2_for_macOS
  make -f /Users/giovannigil/Button/build/Qt_6_10_2_for_macOS/CMakeScripts/ReRunCMake.make
fi

