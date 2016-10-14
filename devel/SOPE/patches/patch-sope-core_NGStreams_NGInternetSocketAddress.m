$NetBSD: patch-sope-core_NGStreams_NGInternetSocketAddress.m,v 1.3 2014/03/13 14:02:44 taca Exp $

Add support for DragonFly.

--- sope-core/NGStreams/NGInternetSocketAddress.m.orig	2016-08-17 12:26:04.000000000 +0000
+++ sope-core/NGStreams/NGInternetSocketAddress.m
@@ -48,7 +48,7 @@
 #include "NGInternetSocketDomain.h"
 #include "common.h"
 
-#if defined(HAVE_GETHOSTBYNAME_R) && !defined(linux) && !defined(__FreeBSD__) && !defined(__GLIBC__)
+#if defined(HAVE_GETHOSTBYNAME_R) && !defined(linux) && !defined(__FreeBSD__) && !defined(__GLIBC__) && !defined(__DragonFly__)
 #define USE_GETHOSTBYNAME_R 1
 #endif
 
