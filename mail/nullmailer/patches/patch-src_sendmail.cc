$NetBSD: patch-src_sendmail.cc,v 1.1 2017/10/28 04:51:06 schmonz Exp $

Avoid "variable-sized object may not be initialized".

--- src/sendmail.cc.orig	2017-10-25 23:36:35.000000000 +0000
+++ src/sendmail.cc
@@ -111,8 +111,9 @@ int do_exec(const char* program, const c
 
 int cli_main(int argc, char* argv[])
 {
-  const char* extra_args[argc + 5] = {0};
+  const char* extra_args[argc + 5];
   int extra_argc = 1;
+  memset(extra_args, 0, sizeof extra_args);
 
   switch (o_mode) {
   case mode_smtp:
