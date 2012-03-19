$NetBSD$

--- libkms/linux.c.orig	2010-03-05 23:21:13.000000000 +0000
+++ libkms/linux.c
@@ -40,6 +40,11 @@
 
 #include <sys/stat.h>
 
+#if defined(sun)
+# include <sys/types.h>
+# include <sys/mkdev.h>
+#endif
+
 #include "internal.h"
 
 #define PATH_SIZE 512
