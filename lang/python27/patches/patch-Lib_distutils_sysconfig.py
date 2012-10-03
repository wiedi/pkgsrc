$NetBSD$

Support multiarch.

--- ./Lib/distutils/sysconfig.py.orig	Mon Apr  9 23:07:29 2012
+++ ./Lib/distutils/sysconfig.py	Mon Aug 13 11:24:35 2012
@@ -246,7 +246,10 @@
     if python_build:
         return os.path.join(os.path.dirname(sys.executable), "Makefile")
     lib_dir = get_python_lib(plat_specific=1, standard_lib=1)
-    return os.path.join(lib_dir, "config", "Makefile")
+    if sys.maxsize > 2**32:
+        return os.path.join(lib_dir, "config", "@LIBARCHSUFFIX.64@".lstrip('/'), "Makefile")
+    else:
+        return os.path.join(lib_dir, "config", "@LIBARCHSUFFIX.32@".lstrip('/'), "Makefile")
 
 
 def parse_config_h(fp, g=None):
