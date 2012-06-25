$NetBSD$

--- boost/filesystem/v3/operations.hpp.orig	2012-04-13 15:42:08.855622688 +0000
+++ boost/filesystem/v3/operations.hpp
@@ -41,6 +41,8 @@
 #include <vector>
 #include <stack>
 
+#include "unistd.h"
+
 #ifdef BOOST_WINDOWS_API
 #  include <fstream>
 #endif
