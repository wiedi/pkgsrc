$NetBSD$

--- cmake/dtrace.cmake.orig	2012-04-19 11:01:22.000000000 +0000
+++ cmake/dtrace.cmake
@@ -158,7 +158,7 @@ IF(CMAKE_SYSTEM_NAME MATCHES "SunOS" AND
   FOREACH(lib ${libs})
     GET_TARGET_PROPERTY(libtype ${lib} TYPE)
     IF(libtype MATCHES STATIC_LIBRARY)
-      SET(static_libs ${static_lics} ${lib})
+      SET(static_libs ${static_libs} ${lib})
     ENDIF()
   ENDFOREACH()
 
